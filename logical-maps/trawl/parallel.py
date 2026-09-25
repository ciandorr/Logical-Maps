"""One coordinator, model-directed child agents, concurrent API calls.

Only HTTP runs in threads. The map engine changes process-global state, so all
tool execution, journals, handoffs and budget accounting stay on this thread.
"""
from collections import Counter, deque
from concurrent.futures import ThreadPoolExecutor, wait, FIRST_COMPLETED
from dataclasses import dataclass
import sys

from . import core as c, delegation, providers, workspaces as w


@dataclass
class Control:
    stopping: bool = False
    in_flight: int = 0
    interrupted: bool = False


def run(quarantine, settings, snapshot, source, *, workspace=None, prepare_only=False):
    if not prepare_only and settings["discovery"]["protocol"] != "offline" and not settings.get("live_api", False):
        raise ValueError("live API calls are disabled in config")
    maximum = settings["limits"].get("max_concurrent_agents", 32)
    if type(maximum) is not int or not 1 <= maximum <= 256:
        raise ValueError("limits.max_concurrent_agents must be an integer from 1 to 256")
    ranked = c.plan(snapshot, settings)
    existing = [c.read(p) for p in (quarantine / "workspaces").glob("*/workspace.json")]
    counts = Counter(m.get("trawl_key", m.get("attempt_key")) for m in existing if not m.get("delegation"))
    pending = {}
    if workspace:
        folder, manifest = w.load(quarantine, workspace, discovery=True)
        pending[workspace] = (folder, manifest)
    else:
        for manifest in sorted(existing, key=lambda m: m["created_at"]):
            folder = quarantine / "workspaces" / manifest["id"]
            if (not manifest.get("delegation") and not (folder / "SEALED.json").exists()
                    and c.read(folder / "state.json")["status"] != "complete"
                    and manifest["source"]["repository"] == source["repository"]
                    and manifest["task"]["topic"] in settings["topics"]):
                pending[manifest["id"]] = (folder, manifest)
    tasks = deque(task for task in ranked if counts[c.trawl_key(task, settings["discovery"], settings["limits"])]
                  < settings["limits"]["trawls_per_question"])
    output_budget = settings["limits"].get("output_tokens_per_run",
                    settings["limits"]["requests_per_run"] * settings["limits"]["max_output_tokens"])
    result = {"requests": 0, "output_tokens_charged": 0, "output_tokens_budget": output_budget,
              "workspaces": [], "checkpoints": [], "errors": [], "peak_concurrent_requests": 0}
    control = Control()
    active, ready, futures = {}, deque(), {}
    queued_children = {}
    finished_children = set()

    def budget_left():
        return (result["requests"] < settings["limits"]["requests_per_run"]
                and result["output_tokens_charged"] < output_budget)

    def completed(agent):
        wid = agent["manifest"]["id"]
        active.pop(wid, None)
        job = agent["manifest"].get("delegation")
        if job and agent["state"]["status"] == "complete":
            checkpoint = next(v for v in reversed(result["checkpoints"]) if v["workspace"] == wid)
            parent = quarantine / "workspaces" / job["parent_workspace"]
            deliver(parent, job, agent["folder"], checkpoint)
            finished_children.add(wid)

    def deliver(parent, job, child, checkpoint):
        # Pin the first checkpoint before publishing any handoff bytes. A crash
        # after directory rename must replay that same checkpoint, not generate
        # a different ID for identical contents and reject its own handoff.
        pointer = parent / "delegations" / job["id"] / "checkpoint.json"
        if pointer.exists():
            checkpoint = c.read(pointer)
        else:
            c.save(pointer, checkpoint)
        delegation.deliver(quarantine, parent, job, child, checkpoint)

    def step(agent, *, reply=None, error=None):
        try:
            if error is not None:
                value = agent["generator"].throw(error)
            else:
                value = agent["generator"].send(reply)
        except StopIteration:
            completed(agent)
            return
        except BaseException:
            # The generator's finally has checkpointed it; replay any saved
            # response on restart if interruption occurred during tool execution.
            active.pop(agent["manifest"]["id"], None)
            raise
        if value is None:
            ready.append(agent)
        else:
            profile, body = value
            future = executor.submit(providers.complete, profile, body,
                enabled=settings.get("live_api", False), timeout=settings["limits"]["timeout_seconds"])
            futures[future] = agent
            control.in_flight = len(futures)
            result["peak_concurrent_requests"] = max(result["peak_concurrent_requests"], len(futures))

    def start(folder, manifest):
        agent = {"folder": folder, "manifest": manifest, "state": c.read(folder / "state.json")}
        agent["generator"] = w.agent_turns(quarantine, settings, folder, manifest, agent["state"], result, control)
        active[manifest["id"]] = agent
        result["workspaces"].append(manifest["id"])
        step(agent)  # Recovery and the initial budget-wait boundary, no API call.
        return agent

    def refresh_children():
        for parent in list(active.values()):
            for job in delegation.jobs(parent["folder"]):
                child_id = job["child_workspace"]
                if child_id in active or child_id in finished_children:
                    continue
                if (parent["folder"] / "delegations" / job["id"] / "result.json").exists():
                    continue
                queued_children.setdefault(child_id, (parent, job))
            state = parent["state"]
            if state.get("waiting_for_subagents") and not delegation.outstanding(parent["folder"]):
                state.pop("waiting_for_subagents", None)
                state["messages"].append({"role": "user", "content":
                    "Your requested subagents have finished. Use subagent_status and read the handed-off files under reference/subagents/. "
                    "These are unreviewed proposals; inspect evidence and integrate useful changes into your own work files, preserving attribution."})
                w.state_save(parent["folder"], state)

    def next_root():
        if pending:
            key = next(iter(pending))
            return pending.pop(key)
        if tasks and not workspace:
            return w.create(quarantine, settings, snapshot, source, tasks.popleft(), ranked)
        return None

    if prepare_only:
        entry = next_root()
        if entry:
            folder, manifest = entry
            result.update(workspaces=[manifest["id"]], files=str(folder / "files"),
                          instructions=str(folder / "INSTRUCTIONS.md"))
        return result

    def consume(future):
        agent = futures.pop(future)
        control.in_flight = len(futures)
        try:
            raw = future.result()
        except BaseException as error:
            step(agent, error=error)
        else:
            step(agent, reply=raw)

    def coordinator_error(error):
        control.stopping = True
        result["errors"].append({"error": "Coordinator " + type(error).__name__,
            "message": str(error) if isinstance(error, ValueError) else
                       "Could not finish a coordinator operation; saved requests and assignments remain resumable."})

    executor = ThreadPoolExecutor(max_workers=maximum, thread_name_prefix="trawl-api")
    try:
        while True:
            try:
                # Process every finished response before granting more requests.
                # A fatal response in the batch stops dispatch; siblings still save.
                for future in list(futures):
                    if future.done():
                        consume(future)
                if not control.stopping:
                    refresh_children()
                if control.stopping or not budget_left():
                    if not futures:
                        break
                else:
                    if not active and not queued_children:
                        entry = next_root()
                        if entry:
                            start(*entry)
                            # Resumed roots may already be waiting on declared
                            # children; load their queue before testing readiness.
                            continue
                        elif not futures:
                            break
                    if len(futures) < maximum and not control.stopping:
                        # Child agents are explicitly requested by models. No
                        # fixed-size fleet is launched or budget multiplied.
                        if queued_children:
                            child_id = next(iter(queued_children))
                            parent, job = queued_children.pop(child_id)
                            child = quarantine / "workspaces" / child_id
                            if (child / "workspace.json").exists():
                                manifest = c.read(child / "workspace.json")
                                if manifest.get("delegation") != job:
                                    raise ValueError("subagent workspace assignment mismatch")
                                if c.read(child / "state.json")["status"] == "complete":
                                    w.seal_workspace(child)
                                    saved = w.checkpoint(quarantine, child_id, reason="subagent-handoff-recovery")
                                    result["checkpoints"].append(saved)
                                    deliver(parent["folder"], job, child, saved)
                                    finished_children.add(child_id)
                                    continue
                            else:
                                child, manifest = w.create(quarantine, settings,
                                    parent["folder"] / "reference" / "source", parent["manifest"]["source"],
                                    job["task"], c.read(parent["folder"] / "reference" / "queue.json"),
                                    wid=child_id, assignment=job)
                            start(child, manifest)
                        # Skip waiting parents without occupying an HTTP slot.
                        for _ in range(len(ready)):
                            agent = ready.popleft()
                            if agent["manifest"]["id"] not in active:
                                continue
                            if agent["state"].get("waiting_for_subagents"):
                                ready.append(agent)
                                continue
                            step(agent)
                            break
                        else:
                            if not futures and not queued_children and active:
                                raise ValueError("subagents cannot progress; saved assignments can be resumed")
                        # Fill free slots, but check completed futures first.
                        if len(futures) < maximum and (queued_children or any(
                                not a["state"].get("waiting_for_subagents") for a in ready)):
                            continue
                if futures:
                    wait(futures, timeout=0.25, return_when=FIRST_COMPLETED)
            except KeyboardInterrupt:
                control.stopping = control.interrupted = True
                print("Stopping new requests; saving replies from active subagents before exiting...", file=sys.stderr, flush=True)
                # Do not leave ThreadPoolExecutor to wait without saving results.
                # Further interrupts keep dispatch stopped while the finite API
                # timeouts finish; a hard process kill leaves durable request logs.
                continue
    except Exception as error:
        coordinator_error(error)
    finally:
        control.stopping = True
        # On any coordinator failure, preserve replies that have already been
        # paid for. No background thread can edit files after releasing the lock.
        while futures:
            try:
                done, _ = wait(futures, timeout=0.25, return_when=FIRST_COMPLETED)
                for future in done:
                    try:
                        consume(future)
                    except Exception as error:
                        # One broken handoff/checkpoint must not discard the
                        # already-paid replies of unrelated child agents.
                        coordinator_error(error)
            except KeyboardInterrupt:
                control.interrupted = True
                continue
        for agent in list(active.values()):
            try:
                agent["generator"].close()  # checkpoints suspended/waiting work
            except KeyboardInterrupt:
                control.interrupted = True
            except Exception as error:
                coordinator_error(error)
        executor.shutdown(wait=True)
    if control.interrupted:
        raise KeyboardInterrupt
    return result

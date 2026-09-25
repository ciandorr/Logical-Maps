"""Small HTTP adapters. Credentials are read only when making a live request."""
from __future__ import annotations

from copy import deepcopy
import json
import os
from urllib.error import HTTPError, URLError
from urllib.parse import urlsplit
from urllib.request import HTTPRedirectHandler, Request, build_opener


class ProviderError(ValueError):
    pass


class ContextLengthError(ProviderError):
    """An explicit pre-generation context rejection, safe to compact around."""


def context_rejection(error):
    """Classify a bounded error body without exposing its potentially secret text.

    Only HTTP 400 context-size errors qualify. Authentication, balance, rate,
    transport and ambiguous server errors must still pause without a retry.
    """
    if error.code != 400:
        return False
    try:
        data = json.loads(error.read(8192))
        detail = data.get("error", {}) if isinstance(data, dict) else {}
        if not isinstance(detail, dict):
            return False
        if detail.get("code") == "context_length_exceeded":
            return True
        message = detail.get("message", "")
        if not isinstance(message, str):
            return False
        message = message.lower()
        return ("maximum context length" in message or "prompt is too long" in message
                or "input token count exceeds" in message and "maximum" in message)
    except (ValueError, OSError):
        return False


def output_tokens(profile, raw, *, reserved):
    """Use reported generation (including reasoning), or charge the reservation.

    This is an output budget, not an estimate of input tokens or currency cost.
    """
    if profile["protocol"] == "offline":
        return 0
    key = "completion_tokens" if profile["protocol"] == "chat-completions" else "output_tokens"
    usage = raw.get("usage")
    value = usage.get(key) if isinstance(usage, dict) else None
    return value if type(value) is int and value >= 0 else reserved


class NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        raise ProviderError("API redirects are disabled; configure the final endpoint")


def prepare(profile, system, prompt, output_limit):
    """Return a credential-free request body, used verbatim in the audit trail."""
    protocol = profile["protocol"]
    extra = profile.get("parameters", {})
    if set(extra) & {"model", "messages", "system", "stream", "n", "tools", "tool_choice",
                     "max_tokens", "max_completion_tokens", "max_output_tokens"}:
        raise ProviderError("parameters may not override model, prompts, tools, or request limits")
    body = {**extra, "model": profile["model"]}
    if protocol == "chat-completions":
        token_field = profile.get("token_parameter", "max_completion_tokens")
        if token_field not in ("max_tokens", "max_completion_tokens"):
            raise ProviderError("invalid token_parameter")
        body.update(messages=[{"role": "system", "content": system},
                              {"role": "user", "content": prompt}],
                    stream=False, n=1)
        body[token_field] = output_limit
    elif protocol == "anthropic-messages":
        body.update(system=system, messages=[{"role": "user", "content": prompt}],
                    max_tokens=output_limit, stream=False)
    elif protocol == "offline":
        body.update(system=system, prompt=prompt, max_output_tokens=output_limit)
    else:
        raise ProviderError(f"unknown protocol: {protocol}")
    return body


def validate_profile(profile):
    allowed = {"protocol", "provider", "model", "endpoint", "api_key_env", "token_parameter", "parameters"}
    if set(profile) - allowed:
        raise ProviderError("unknown profile fields; credentials belong in environment variables")
    if not isinstance(profile.get("parameters", {}), dict):
        raise ProviderError("parameters must be an object")
    for key in ("protocol", "provider", "model"):
        if not isinstance(profile.get(key), str) or not profile[key].strip():
            raise ProviderError(f"profile needs {key}")
    prepare(profile, "test", "test", 1)
    if profile["protocol"] == "offline":
        return
    parts = urlsplit(profile.get("endpoint", ""))
    if (parts.scheme != "https" and not (parts.scheme == "http" and
            parts.hostname in ("localhost", "127.0.0.1", "::1"))):
        raise ProviderError("endpoint must use HTTPS (HTTP is allowed only for loopback)")
    if parts.username or parts.password or parts.query or parts.fragment:
        raise ProviderError("endpoint must not contain credentials, query, or fragment")
    env = profile.get("api_key_env")
    if env is not None and (not isinstance(env, str) or not env.replace("_", "").isalnum()):
        raise ProviderError("api_key_env must name an environment variable")


def complete(profile, body, *, enabled=False, timeout=120):
    validate_profile(profile)
    if profile["protocol"] == "offline":
        return {"model": profile["model"], "id": "offline", "usage": {},
                "offline": True, "text": "Offline smoke test: no mathematical search performed."}
    if not enabled:
        raise ProviderError("live API calls are disabled in config")
    headers = {"Content-Type": "application/json"}
    env = profile.get("api_key_env")
    key = os.environ.get(env, "") if env else ""
    if env and not key:
        raise ProviderError(f"set the environment variable {env}")
    if profile["protocol"] == "anthropic-messages":
        headers["anthropic-version"] = "2023-06-01"
        if key:
            headers["x-api-key"] = key
    elif key:
        headers["Authorization"] = "Bearer " + key
    request = Request(profile["endpoint"], json.dumps(body).encode(), headers, method="POST")
    try:
        with build_opener(NoRedirect()).open(request, timeout=timeout) as response:
            raw = response.read(8_000_001)
        if len(raw) > 8_000_000:
            raise ProviderError("API response exceeds 8 MB")
        return json.loads(raw)
    except HTTPError as error:
        # Do not log provider error bodies or headers: they may echo secrets.
        if context_rejection(error):
            raise ContextLengthError("API rejected the request because its context is too long") from None
        raise ProviderError(f"API HTTP {error.code}; request was not retried") from None
    except (URLError, TimeoutError, OSError):
        raise ProviderError("API transport failed; request was not retried") from None
    except json.JSONDecodeError:
        raise ProviderError("API returned invalid JSON") from None


def unpack(profile, raw):
    """Reject truncation/refusal/tool turns rather than treating them as evidence."""
    protocol = profile["protocol"]
    if protocol == "offline":
        text = raw["text"]
    elif protocol == "chat-completions":
        choice = raw["choices"][0]
        if choice.get("finish_reason") != "stop" or choice["message"].get("refusal"):
            raise ProviderError("completion did not finish normally")
        text = choice["message"]["content"]
    else:
        if raw.get("stop_reason") != "end_turn":
            raise ProviderError("message did not finish normally")
        text = "\n".join(b["text"] for b in raw["content"] if b.get("type") == "text")
    if not isinstance(text, str) or not text.strip():
        raise ProviderError("response has no text")
    if text.strip().startswith("```"):
        lines = text.strip().splitlines()
        if lines[-1] == "```":
            text = "\n".join(lines[1:-1])
    return json.loads(text)


def prepare_agent(profile, system, messages, output_limit, functions):
    """Build a multi-turn file-editing request using a provider's native tools."""
    messages = deepcopy(messages)
    body = prepare(profile, system, "", output_limit)
    if profile["protocol"] == "chat-completions":
        body["messages"] = [{"role": "system", "content": system}, *messages]
        body["tools"] = [{"type": "function", "function": f} for f in functions]
    elif profile["protocol"] == "anthropic-messages":
        body["messages"] = messages
        body["tools"] = [{"name": f["name"], "description": f["description"],
                          "input_schema": f["parameters"]} for f in functions]
    else:
        body.update(messages=messages, tools=functions)
    return body


def output_limited(profile, raw):
    """Recognize a completed API response cut short by its generation limit.

    This does not make its text or tool calls executable. Refusals and unknown
    stop reasons still use the ordinary failure path.
    """
    if profile["protocol"] == "chat-completions":
        choices = raw.get("choices")
        return (isinstance(choices, list) and len(choices) == 1
                and isinstance(choices[0], dict) and choices[0].get("finish_reason") == "length"
                and isinstance(choices[0].get("message"), dict)
                and not choices[0]["message"].get("refusal"))
    if profile["protocol"] == "anthropic-messages":
        return raw.get("stop_reason") == "max_tokens"
    return False


def unfinished_parts(profile, raw):
    """Extract exposed text for a human-readable archive; never execute it.

    Opaque/redacted thinking remains in the verbatim raw response. We cannot
    recover reasoning a provider did not expose.
    """
    if profile["protocol"] == "chat-completions":
        message = raw["choices"][0]["message"]
        return message.get("reasoning_content"), message.get("content"), message.get("tool_calls")
    blocks = raw.get("content", [])
    reasoning = "\n\n".join(b["thinking"] for b in blocks if b.get("type") == "thinking" and isinstance(b.get("thinking"), str))
    text = "\n\n".join(b["text"] for b in blocks if b.get("type") == "text" and isinstance(b.get("text"), str))
    return reasoning, text, [b for b in blocks if b.get("type") == "tool_use"]


def agent_turn(profile, raw):
    """Preserve assistant blocks, normalize calls, and accept ordinary final text.

    Arguments are parsed per tool, so one malformed call cannot discard earlier
    successful saves. Truncated responses are logged, never executed.
    """
    protocol = profile["protocol"]
    if protocol == "offline":
        return {"role": "assistant", "content": "Offline smoke test: no mathematical search performed."}, []
    if protocol == "chat-completions":
        choice = raw["choices"][0]
        message = choice["message"]
        if choice.get("finish_reason") not in ("stop", "tool_calls") or message.get("refusal"):
            raise ProviderError("agent response was refused, truncated, or incomplete")
        calls = [{"id": c["id"], "name": c["function"]["name"],
                  "arguments": c["function"]["arguments"]} for c in message.get("tool_calls", [])]
        # Do not echo response-only fields such as annotations back into requests.
        assistant = {k: message[k] for k in ("role", "content", "tool_calls", "reasoning_content") if k in message}
    else:
        if raw.get("stop_reason") not in ("end_turn", "tool_use"):
            raise ProviderError("agent response was refused, truncated, or incomplete")
        assistant = {"role": "assistant", "content": raw["content"]}
        calls = [{"id": b["id"], "name": b["name"], "arguments": b["input"]}
                 for b in raw["content"] if b.get("type") == "tool_use"]
    if len({c["id"] for c in calls}) != len(calls):
        raise ProviderError("duplicate tool call identifiers")
    return assistant, calls


def tool_messages(profile, results):
    if profile["protocol"] == "anthropic-messages":
        return [{"role": "user", "content": [{"type": "tool_result", "tool_use_id": cid,
            "content": json.dumps(value, ensure_ascii=False), "is_error": "error" in value}
            for cid, value in results]}]
    return [{"role": "tool", "tool_call_id": cid,
             "content": json.dumps(value, ensure_ascii=False)} for cid, value in results]

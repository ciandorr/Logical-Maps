# Translating the source's L¹ metric to random variables

In *Symmetries of value*, p. 23, distance between two laws is the infimum of
E|A−B| over all couplings, with infinity allowed. Call this extended metric W.
The node in this topic instead uses $E|X_n- X|$ for the actual variables.

Assume **Stochastic Equivalence**, the full random-variable domain, and the
real chart used in the source theorem packages. If W-continuity holds, then
actual-coupling $L^{1}$ convergence implies W-convergence, so the topic's closure
clause follows immediately.

Conversely, suppose laws $\mu _n$ converge to $\mu$ in W. Pick couplings $(A_n,B_n)$ with
laws $\mu _n,\mu$ and $E|A_n- B_n|\to 0$ (an approximate infimum within 1/n suffices).
On a standard Borel space, disintegrate these couplings over their common
second marginal and realize them with a single B of $\operatorname{law} \mu$ and a sequence of
auxiliary uniform random variables. The resulting $A'_n$ all share the same B
and satisfy $E|A'_n- B|\to 0$. All are realizable on the standing atomless space.
By Stochastic Equivalence, each comparison of $\mu _n$ with a fixed $\operatorname{law} \nu$ holds
for these representatives as well. Apply the topic's continuity clause and
transfer the conclusion back by Stochastic Equivalence.

Without Stochastic Equivalence the transfer between representatives is
unavailable. This is why a metric on laws was not used in the node definition:
its zero-distance constant sequences would already force equal-law variables
to be indifferent by reflexivity and closure.

This verifies a **translation of the continuity assumption**. It does not
independently prove the paper's DTU $\Rightarrow \operatorname{EU}$ extension after adding continuity,
or the reverse direction of its Corollary 5. Those are cited source results.

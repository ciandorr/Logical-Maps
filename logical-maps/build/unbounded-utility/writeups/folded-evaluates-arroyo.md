# Folded Expectation directly evaluates Arroyo

**Source and work accounting.** Zachary Goodsell's *Symmetries of value*,
pp. 29–30, explicitly states that Arroyo has folded expectation \(\ln2\), and
Theorem 8 gives its evaluation. The unshifted tail calculation below was
supplied by GPT-6 (Codex), 9 September 2026, to expose the smaller sufficient
package. It is a source extraction with a small calculation and premise audit,
not a new discovery of Arroyo's value. No independent checker or Lean
certification is asserted.

Assume Rich Outcomes and Folded Expectation. Let

\[
\Pr(A=(-1)^{n+1}(n+1))=\frac1{n(n+1)},\qquad n\ge1,
\]

and write \(h(t)=\Pr(A>t)-\Pr(A<-t)\) for \(t\ge0\).
For \(t\in[m+1,m+2)\), \(m\ge1\), apart from immaterial endpoints,

\[
h(t)=\sum_{n=m+1}^{\infty}\frac{(-1)^{n+1}}{n(n+1)}.
\]

The alternating-series estimate gives

\[
|h(t)|\le\frac1{(m+1)(m+2)}.
\]

On \([0,2)\) the tail difference is bounded by one. Thus

\[
\int_0^\infty |h(t)|\,dt
\le2+\sum_{m=1}^{\infty}\frac1{(m+1)(m+2)}<\infty.
\]

For a symmetric cutoff \(T=N+1\), bounded tail integration gives

\[
\int_0^{N+1}h(t)\,dt
=\sum_{n=1}^{N}\frac{(-1)^{n+1}}n
 +(N+1)\sum_{n=N+1}^{\infty}\frac{(-1)^{n+1}}{n(n+1)}.
\]

The final term has absolute value at most \(1/(N+2)\), while the finite
alternating harmonic sum tends to \(\ln2\). Therefore Arroyo's absolutely
defined folded expectation is \(\ln2\). Sure \(\ln2\), available by Rich
Outcomes, has the same folded expectation. The axiom gives

\[
A\sim\ln2.
\]

This holds for every random variable with the indicated utility law because
the folded-tail condition itself depends only on that law. No separate
Stochastic Equivalence, shift symmetry, continuity or DU package is needed.
The use of the limit above computes an already absolutely integrable folded
tail; it does not silently interpret a conditionally convergent expected
utility as an ordinary Lebesgue expectation.

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 8 and Theorem 8, pp. 29–30: Arroyo has folded expectation ln 2

# Transitivity ∧ Independence ∧ Mixture continuity ⇒ Closed-graph continuity

<p class='cert'>Result — ai; produced by Claude Fable 5.1 (Cowork session), 2026-09-08. Not yet checked.</p>

**Claim.** If $\succcurlyeq$ is reflexive and transitive, satisfies independence, and has closed sections $\{\lambda : \lambda p + (1-\lambda) q \succcurlyeq r\}$ and $\{\lambda : r \succcurlyeq \lambda p + (1-\lambda) q\}$, then $\{(p,q) : p \succcurlyeq q\}$ is closed in $\Delta(X)^2$.

**Proof.** Let $V = \{x \in \mathbb{R}^X : \sum_x x = 0\}$ and $D = \Delta(X) - \Delta(X) \subseteq V$, which is compact, convex, and contains $0$. Put
$$K = \{\, q - p : q \succcurlyeq p \,\}.$$

*(i) $K$ depends only on differences.* If $q - p = q' - p'$ then $\tfrac12 q + \tfrac12 p' = \tfrac12 q' + \tfrac12 p$. By independence with $\lambda = \tfrac12$, $q \succcurlyeq p \iff \tfrac12 q + \tfrac12 p' \succcurlyeq \tfrac12 p + \tfrac12 p'$ and $q' \succcurlyeq p' \iff \tfrac12 q' + \tfrac12 p \succcurlyeq \tfrac12 p' + \tfrac12 p$. The two right-hand sides are the same pair.

*(ii) $K$ is a cone in $D$.* If $x \in K$, $t > 0$ and $tx \in D$, then $tx \in K$. For $t < 1$: from $q \succcurlyeq p$, independence with $r = p$ gives $tq + (1-t)p \succcurlyeq p$, whose difference is $t(q-p)$. For $t > 1$ apply the previous case to $tx$.

*(iii) $K$ is convex.* For $x = q - p$ and $y = q' - p'$ in $K$, independence gives $\tfrac12 q + \tfrac12 q' \succcurlyeq \tfrac12 p + \tfrac12 q'$ and $\tfrac12 q' + \tfrac12 p \succcurlyeq \tfrac12 p' + \tfrac12 p$; transitivity gives $\tfrac12 q + \tfrac12 q' \succcurlyeq \tfrac12 p + \tfrac12 p'$, with difference $\tfrac12 x + \tfrac12 y$.

*(iv) $K$ is closed along every line.* Let $[x_0, x_1] = \ell \cap D$ and $x(\lambda) = \lambda x_1 + (1-\lambda) x_0$. Choose $\varepsilon > 0$ and the uniform lottery $c$ with $c + \varepsilon x(\lambda) \in \Delta(X)$ for all $\lambda$. By (ii), $x(\lambda) \in K \iff \varepsilon x(\lambda) \in K \iff c + \varepsilon x(\lambda) \succcurlyeq c$, and $c + \varepsilon x(\lambda) = \lambda(c + \varepsilon x_1) + (1-\lambda)(c + \varepsilon x_0)$, so $\{\lambda : x(\lambda) \in K\}$ is a section, closed by mixture continuity.

*(v)* A convex subset of a finite-dimensional space meeting every line in a closed set is closed: for $x \in \overline{K} \setminus K$ and $y$ in the relative interior of $K$, $[y, x) \subseteq K$ by the accessibility lemma, so $K \cap \mathrm{line}(y,x)$ is not closed. Hence $K$ is closed, and $(p_n, q_n) \to (p, q)$ with $q_n \succcurlyeq p_n$ gives $q - p \in K$. ∎

**Remark.** This bridges the mixture-continuity axiom of the vNM literature and the closed-graph axiom of Dubra–Maccheroni–Ok. The map reaches the multi-utility representation from closed-graph continuity without it.

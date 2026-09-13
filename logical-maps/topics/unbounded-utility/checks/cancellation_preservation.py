"""Exact algebra diagnostics for the geometric-noise argument."""
from fractions import Fraction as F


# Coefficient of nu^{*n} in 2 rho - nu*rho, with rho_n=2^{-(n+1)}.
for n in range(101):
    coefficient = 2 * F(1, 2 ** (n + 1)) - (F(1, 2 ** n) if n else 0)
    assert coefficient == (1 if n == 0 else 0)


def add(*terms):
    result = {}
    for term in terms:
        for name, value in term.items():
            result[name] = result.get(name, F(0)) + value
    return {name: value for name, value in result.items() if value}


def scale(weight, term):
    return {name: weight * value for name, value in term.items()}


# Formal probability-law basis, after substituting the renewal identity.
alpha = {'alpha': F(1)}
beta = {'beta': F(1)}
alpha_nu_rho = {'alpha*nu*rho': F(1)}
beta_nu_rho = {'beta*nu*rho': F(1)}
alpha_rho = add(scale(F(1, 2), alpha), scale(F(1, 2), alpha_nu_rho))
beta_rho = add(scale(F(1, 2), beta), scale(F(1, 2), beta_nu_rho))
eta = add(scale(F(1, 2), alpha_nu_rho), scale(F(1, 2), beta_nu_rho))

a_plus_w = add(scale(F(2, 3), alpha_rho), scale(F(1, 3), beta_nu_rho))
b_plus_w = add(scale(F(2, 3), beta_rho), scale(F(1, 3), alpha_nu_rho))
assert a_plus_w == add(scale(F(1, 3), alpha), scale(F(2, 3), eta))
assert b_plus_w == add(scale(F(1, 3), beta), scale(F(2, 3), eta))
assert add(a_plus_w, scale(-1, b_plus_w)) == {'alpha': F(1, 3), 'beta': F(-1, 3)}
assert sum(a_plus_w.values()) == sum(b_plus_w.values()) == sum(eta.values()) == 1
assert all(value >= 0 for law in (a_plus_w, b_plus_w, eta) for value in law.values())
print('PASS: geometric renewal coefficients and exact common-mixture identities.')

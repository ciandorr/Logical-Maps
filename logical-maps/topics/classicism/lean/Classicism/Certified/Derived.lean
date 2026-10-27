import Classicism.Tools.Translate
import Classicism.Background.Necessity

/-!
# Derivations checked at build time

A few derivations the translator produces, run at build time as a check that the whole
chain — gated shallow proof, derivation in `H` closed under Subst — is in working order. Each `foo.derivable` declared here is a kernel-checked derivation of
`foo.quoted`.

Only quick ones are here. A derivation of a library theorem costs up to a minute, most
of it the kernel evaluating substitutions and the first one in a file paying for the
specializations of the Boolean-algebra lemmas that the rest reuse; so the library-wide
run is `#classicism_derive_audit`, run by hand (see `Meta/README.md`).
-/

#classicism_derive Classicism.modal_K Classicism.converse_barcan

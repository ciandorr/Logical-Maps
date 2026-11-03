import Classicism.Coalesced.Category
import Classicism.Coalesced.Premodel
import Classicism.Coalesced.Transport
import Classicism.Coalesced.Model
import Classicism.Coalesced.Full
import Classicism.Coalesced.Distinguished
import Classicism.Coalesced.Complete
import Classicism.Coalesced.SumData
import Classicism.Coalesced.Transfer
import Classicism.Coalesced.Parameters
import Classicism.Coalesced.Interpretations
import Classicism.Coalesced.Definable
import Classicism.Coalesced.Pinned
import Classicism.Coalesced.PinnedBarcan

/-!
# Coalesced sums

Classicism, Appendix E (Definition E.2, Theorem 3.26), for intensional action models, in a
generality that covers the members of the map's group `coalesced-sums`.

The data are a family of intensional action premodels `A k` on categories `C k`, indexed by
a type `ι`, and the **root arrows** (`RootArrows`): an action `R` of the disjoint union
`Σ k, C k`, whose value at `V` is the set of arrows from the new root `W₀` to `V`, and a
monoid of root endo-arrows acting on it naturally (only the identity, except in the
substitution members). The coalesced sum of the categories (`CoalescedSum`,
`Category.lean`) has the root and the component objects as objects; its arrows out of a
component object are the component's. Appendix E's **distinguished arrows** are the case
`R V = Hom (W k, V)` (`RootArrows.distinguished`); the interpretation-arrow members take
`R V` to be the interpretations of a signature at `V`.

At the root (`Premodel.lean`), a **root action** gives the root domain at each type with
its transports along the root arrows, and a **root inclusion** reads the root relational
elements as intensions; at a component object everything is the component's, by
definition. The theorems:

* **transport** (`RootAction.sem_transport`, `Transport.lean`): along a root arrow
  `r : W₀ → V`, the value of a term is its value in `V`'s component re-based at `V` with the
  constants transported along `r` (`RootAction.component`);
* **root closure** (`RootAction.isModel_iff`, `Model.lean`): the sum is a model iff those
  re-based components are models and the root domains are closed under the language at
  the root; with the **fullest** root domains, every **landing** intension, closure is
  automatic (`RootAction.isModel_of_fullest`);
* the truncation of the sum by a root arrow is the re-based component
  (`RootAction.truncate_arr_sem`), so what holds there is possible at the root
  (`RootAction.holds_dia_of_component`).

The root domains are built by recursion on the type from a **domain selector**
(`Selector`, `Full.lean`), the fullest being `fullAction`, with root individuals any set
with natural transports (`AtomAction`); for selected domains root closure says that the
selector contains the values of the terms (`rootClosed_iff_selected`). Appendix E itself,
over the distinguished arrows (`Distinguished.lean`): product root individuals, fullest
domains, the unions of the components' intensions as the root values of the constants, and
**Theorem 3.26** (`theorem_3_26`, `coalesced_sum_theorem`): each component is the
truncation of the sum by its distinguished arrow.

With complete components (`Complete.lean`), every sentence consistent with `C` is possible
at the root (`RootAction.holdsAx_possibility_of_complete`): Maximalism. The coalesced sum of
the complete family of `Completeness/`, over the distinguished arrows, is Appendix E's
maximalist root (`maximalist`), so Maximalism is consistent with `C`
(`maximalism_consistent`). The map's group `coalesced-sums` takes as its parameter the data of
a coalesced sum that is a model (`SumData`, `SumData.lean`), with its conditions and three
members. Over distinguished arrows with the fullest root domains a root entity is its extension
at the root and its parts in the components, chosen freely (`SumData.thread`, `Transfer.lean`):
so a component's counterexample at its root transfers to the root, for BF and Atomicity at `t`
(`SumData.not_holds_barcanT`, `SumData.not_holds_atomicityT`).

In standard terms the coalesced sum of the categories is the *collage* (cograph) of the
profunctor from the one-object category `End` to `Σ k, C k` given by `R`, and an action is
a copresheaf.
-/

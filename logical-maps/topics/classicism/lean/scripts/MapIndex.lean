import Classicism
import Classicism.Map
import Classicism.MapModels
import Classicism.MapDerived
import Classicism.Tools.MapIndex

/-! Writes `map/index.json`, the index of the map's certificates (`Tools/MapIndex.lean`).
Run from `Cian/` after `lake build`:

    lake env lean scripts/MapIndex.lean

Not part of the library build. -/

#classicism_map_index "map/index.json"

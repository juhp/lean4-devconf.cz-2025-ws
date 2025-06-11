-- # Type Universe levels

-- You may have noticed some weird annotations/syntax like `fnname.{u}`
-- and `Type u` etc

-- eg
#check List.cons

#check List

example: Type := Nat

-- There is a hierarchy of Type Universes
-- (to avoid Russell's paradox)
-- - first (lowest) universe is `Prop` (proposition)
--   or `Sort 0` (contained in Type)
-- Values of propositions are proofs
-- - see "Propositions as Types"
-- Like types, all proofs also erased from compiled code
-- `Sort 1` is `Type` (short for `Type 0`)

example : Type 1 := Type 0

example: Type 0 := Nat
example: Type 0 := List Bool
example: Type 0 := String

example : Type 0 := Prop
example : Type (u+1) := Type u

#check Option -- Option.{u} (α : Type u) : Type u

-- ## Equality types (Eq)
example : Prop := 1 = 1

example : 1 = 1 := Eq.refl 1
example : 1 = 1 := rfl

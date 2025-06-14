-- # Namespaces

-- namespaces are the primarily structuring of Lean code

-- _every structure and inductive type has an associated namespace_

#check List.length

-- open a namespace
open List in
#check length

#check Option.some

#eval (some 'a').isNone

#eval Nat.zero.add 1

#eval #[1,2].size

def List.lengthplus1: List α -> Nat :=
  -- point-free
  Nat.succ ∘ length

def List.lengthplus1' (ℓ: List α): Nat :=
  Nat.succ ℓ.length

#eval [1,2].lengthplus1

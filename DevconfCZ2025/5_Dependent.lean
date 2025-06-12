-- # Dependent types

-- # Vectors (sized lists)  (dependent!)

-- Indexed Families
inductive Vect (α : Type) : Nat -> Type where
   | nil : Vect α 0
   | cons : α -> Vect α n -> Vect α (n + 1)

open Vect

def v2 := cons 2 (cons 1 nil)
def v3 := cons 1 (cons 2 (cons 3 nil))

def Vect.replicate (n : Nat) (x : α) : Vect α n :=
  match n with
  | 0 => .nil
  | k + 1 => .cons x (replicate k x)

#eval Vect.replicate 3 'a'

def Vect.zip : Vect α n -> Vect β n -> Vect (α × β) n
  | .nil, .nil => .nil
  | .cons x xs, .cons y ys => .cons (x, y) (zip xs ys)

#eval Vect.zip v3 v3

--#eval Vect.zip v2 v3  -- application type mismatch


-- # Fin

-- dependent record type

-- indexed family of (dependent) types
structure MyFin (n : Nat) where
  val  : Nat
  isLt : val < n

-- MyFin 0 is empty (uninhabited)
-- 0 : MyFin 1
-- 0, 1 : MyFin 2
-- 0, 1, 2 : MyFin 3
-- 0, 1, 2, 3 : MyFin 4
-- :... etc

#eval (⟨5,by decide⟩ : MyFin 8)

#eval (⟨1,by simp⟩ : MyFin 2)


-- # Fin

-- Fin is the built-in finite type

#eval (5 : Fin 7)

def size : Nat := 4
def three_of n := Fin.ofNat' (n+1) 2

#eval IO.println s!"This is {three_of size + 1} out of {size}"

-- note Fin is modulo (unlike MyFin):
example : (3 : Fin 5) = (8 : Fin 5) := by rfl

-- # Algebraic Datatypes (ADT's)

-- ## Product types:

-- - Tuples

def pair : Nat × Bool := (1,true)

#eval pair

example := (2,3)
example : Nat × Nat := (2,3)
example := ((2,3) : Nat × Nat)

-- - Structures (record types)

structure Person where
  name : String
  tall : Bool

def person1 := Person.mk "Sara" true

def person2 : Person := ⟨"John",false⟩


def same : Person.mk "Bob" true = ⟨"Bob", true⟩ := by rfl

#check Person.mk "Bob" true = ⟨"Bob", true⟩

def same' : Person.mk "Sara" true = ⟨ "Sara", true ⟩ := Eq.refl person1

-- other equivalent record syntax for structures:

example : Person := {name := "Jane", tall := false}

def person3 : Person where
  name := "Jan"
  tall := true

-- ## Sum types

-- Inductive datatypes

inductive Boolean where
  | true : Boolean
  | false : Boolean

-- option type (à la Haskell)
inductive Maybe (α : Type) where
  | nothing : Maybe α
  | just : α -> Maybe α

-- Lean has Empty
inductive Void where

-- Lean has Option
inductive Optional (α : Type) where
  | some : α -> Optional α
  | none : Optional α

#eval Optional.some 'a'
#eval some 'b'

-- example: (Option.some 'a' = (Optional.some 'a')) := sorry -- type mismatch

-- Lean uses Nat (defined as GADT)
inductive Natural where
  | zero : Natural
  | succ : Natural -> Natural

open Natural in
example := succ (succ zero)  -- 2

-- really only an ADT:
inductive MyNat : Type where
  | zero : MyNat
  | succ (n : MyNat) : MyNat

example : MyNat := MyNat.zero.succ.succ
example : MyNat := .succ MyNat.zero.succ.succ

-- ## Lists

-- Lean has List α
inductive List' (α : Type) where
  | nil : List' α
  | cons : α -> List' α -> List' α

open List' in
example := cons 'a' (cons 'b' nil)  -- ['a','b']

#check [1,2,3]

def numlist : List Nat := [1,2,3,4]

#eval numlist[2]
#eval numlist[4]?

-- :: is operator of cons
#eval (0 :: numlist).length

#eval numlist.head?
-- #eval numlist.head (by decide)

-- ## Arrays

example : Array Nat := #[1,2,3]

def fruits := #["apple", "banana", "carrot"]

#eval fruits.size

def arr := #[true,false]

#eval arr[1]
#eval arr[2]?
-- #eval arr[2]! -- Error: index out of bounds

-- also Bitvectors (Bitvect n): not covered today

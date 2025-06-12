-- # Lean4 primitive types

def one : Nat := 1  -- Natural number (>= 0)

-- example : type := value

example : Nat := 0
example := 1
example := (2 : Nat)

example : Char := 'a'

example := '和'  -- Unicode character

example : Bool := true || false  -- Boolean

#eval true || false

-- also `Int`, `USize`, `UInt16`, `UInt32`, etc

#check UInt32
#check Int64

-- arbitrary precision integers
example : Int := 2 ^ 16
#eval 2 ^ 75

example : UInt8 := one

#check (one : UInt8)

example : Float := 1.0

example : Unit := ()

#check Empty

-- ## Binary Equality (BEq)

#eval 1 + 1 == 2

#eval "text" == "txt"

#eval BEq.beq 1 (2 - 1)

#print BEq.beq

#eval if one < 2 then "less" else "diff"

#check 1 < 2

#eval (compare 'J' 'P')
#eval (compare 'J' 'P').isLT

#eval 1 == 1

------

-- # Compound types

-- ## String

def hello : String := "world"  -- UTF-8

#check hello

#eval hello

#eval (hello, one)  -- a pair or tuple

#eval (hello, (true, one))  -- right associative

-- interpolation
#eval s!"{hello} {toString one}st"

-- ## Products

-- type variables
variable (α β : Type)

#check Prod α β
#check α × β

#eval ((1,true) : Nat × Bool)

-- ## Sum types

#check Sum α β
#check α ⊕ β

#eval (Sum.inl "text" : Sum String Nat)

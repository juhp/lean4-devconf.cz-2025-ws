-- # Lean4 primitive types

def one : Nat := 1  -- Natural number (>= 0)

-- example : type := value

example : Nat := 0
example := 1
example := (2: Nat)

example : Char := 'a'

example := '和'  -- Unicode character

example : Bool := true || false  -- Boolean

-- also `Int`, `UInt`, `USize`, `UInt16`, etc

example : UInt8 := one

example : Float := 1.0

example : Unit := ()

#check Empty

-- ## Binary Equality (BEq)

#eval 1 + 1 == 2

#eval "text" == "txt"

#eval BEq.beq 1 (2 - 1)

#print BEq.beq

#eval if one == 1 then "same" else "diff"

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

-- ## Sum types

#check Sum α β
#check α ⊕ β

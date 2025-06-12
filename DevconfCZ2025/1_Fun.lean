-- # Lambda functions

-- note the parens are only needed for type annotations

-- `example [: type] := value`

example := fun x => x + 1

example (n : Nat) : Nat :=
  n + 1

example := (· + 1)

#eval (fun x => x + 1) 2

def incr (n : Nat) := n + 1

#eval incr 5

#eval incr 3 + incr 5
#eval Nat.succ 3 + Nat.succ 5

-- identity function
example : α -> α := id

def id' : α -> α := fun x => x

#eval id' (1,"hi")


-- # Termination

-- functions in Lean are total: ie they must terminate
-- (unless that are prefixed partial).

-- Ackermann function
def ackermann : Nat → Nat → Nat
  | 0, m => m + 1
  | n + 1, 0 => ackermann n 1
  | n + 1, m + 1 => ackermann n (ackermann (n + 1) m)
termination_by n m => (n, m)

#eval ackermann 3 4

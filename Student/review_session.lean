def fact: Nat → Nat
| 0 => 1
| n' + 1 => (n' + 1) * fact n'

#eval fact 10

def list_len {α : Type} : List α → Nat
| [] => 0
| _::t => 1 + list_len t


#eval list_len [2, 3, 4]

def sum_cubes: List Nat → Nat
| [] => 0
| h::t => h^3 + sum_cubes t

def product: List Nat → Nat
| [] => 1
| h::t => h * product t

#eval product [1, 2, 3]
#eval sum_cubes [1, 2, 3, 4, 5]


def number_trues : List Bool → Nat
| [] => 0
| h::t => match h with
    | true => 1 + (number_trues t)
    | false => (number_trues t)

#eval number_trues [true, true, false]


def is_even : Nat → Bool
| 0 => true
| 1 => false
| (n + 2) => is_even n

#eval is_even 4

-- super solid truth table outputs know what its about. apply to expression, 
-- list of all truth values for expression under all interpretations

-- and the list down to a single value
import Mathlib.Data.Set.Basic

/-!
# Final Exam: Part 2

Here you can show that you've got what we covered in class,
up to and including set theory. The focus is on set theory,
as it encompassess the underlying logic as well. A hint: You
will want to review the existential quantifier and proofs of
existentially quantified propositions.

## Problem #1:

Use set comprehension notation in Lean to define *odds*
as the set of odd numbers, by way of a membership predicate
for this set.
-/

-- -- Here
def odds : Set Nat := { n : Nat | n % 2 = 1}
#reduce 1 ∈ odds
example : 3 ∈ odds := rfl
example : ¬(2 ∈ odds) := fun h => nomatch h

/-!
## Problem #2:

Use set comprehension and other set notations in Lean to
define the set, *perfect_squares*, of natural numbers, n,
such that each n is the square of some natural number, m.
For example, 36 is a perfect square because it is the square
of another number, namely m = 6.
-/
def perfect_squares : Set Nat := { n : Nat | ∃ m : Nat, n = m ^ 2 }
example : 36 ∈ perfect_squares := ⟨ 6, rfl ⟩



/-!
## Problem #3:

Use set comprehension notation to define the set, odd_perfects,
to be the intersection of the odds and the perfect squares.
-/

def odd_perfects := odds ∩ perfect_squares

/-!
## Problem #4:

Formally state and prove the proposition that 9 ∈ odd_perfects.
Hint: A proof within a proof.
-/

/-
We can prove that 9 is in the set of odd_perfects by proving that 9 is in the odd set
and 9 is in the perfect_squares set. We can use the reflexive tactic to verify that 9 % 2 = 1
and also show that the 9 is a perfect square for an m value of 3: n = m ^2 validated by 9 = 3 ^ 2.
-/
-- Here
example : 9 ∈ odd_perfects := ⟨ rfl, ⟨ 3, rfl ⟩ ⟩

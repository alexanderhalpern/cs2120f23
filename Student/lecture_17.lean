#check Empty

-- inductive Empty : Type

inductive Chaos : Type

def from_empty (e : Empty) : Chaos := nomatch e

#check False
-- inductive False : Prop

def from_false {P : Prop} (p: False) : P := False.elim p

def from_false_true_is_false (p : False) : True = False := False.elim p

-- no introduction rule

/-!

-/

#check Unit
#check True

#check True.intro


def proof_of_true : True := True.intro

def false_implies_true : False → True := λ f => False.elim f

#check Prod

/-
structure Prod (α : Type u) (β : Type v) where
  fst : α
  snd : β
-/

#check And
/-
structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b
-/

inductive Birds_chirping : Prop
| yep
| boo

inductive Sky_blue : Prop
| yep

#check (And Birds_chirping Sky_blue)
theorem both_and : And Birds_chirping Sky_blue := And.intro Birds_chirping.boo Sky_blue.yep

/-!
Proof Irrelevance
-/

namespace cs2120f23
inductive Bool : Type
| true
| false

theorem proof_equal : Birds_chirping.boo = Birds_chirping.yep := by trivial

#check Sum

#check Or

theorem one_or_other : Or Birds_chirping Sky_blue := Or.inl Birds_chirping.yep
theorem one_or_other' : Or Birds_chirping Sky_blue := Or.inr Sky_blue.yep

example : Or Birds_chirping (0=1) := Or.inl Birds_chirping.boo
example : (0=1) ∨ (1=2) := _

theorem or_comm {P Q : Prop} : P ∨ Q → Q ∨ P :=
λ d =>
  match d with
  | Or.inl p => Or.inr p
  | Or.inr q => Or.inl q


def no (α : Type) := α → Empty

#check Not

example : no Chaos := λ (c : Chaos) => nomatch c

inductive Raining : Prop

example : ¬ Raining := λ (r : Raining) => nomatch r

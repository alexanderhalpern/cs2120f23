/-!
# Homework #3

Near final DRAFT. 

## Overview and Rules

The purpose of this homework is to strengthen your
understanding of function composition and of enumerated
and product data types. 

The collaboration rule for this homework is that
you may *not* collaborate. You can ask friends and
colleagues to help you understand material in the
class notes, but you may not discuss any aspect
of this homework itself with anyone other than one
of the instructors or TAs. Why? Because *you* need
to learn this material to pass the exam to come.
-/

/-!
## Problem #1

Define a function of the following polymorphic type:
{α β γ : Type} → (β → γ) → (α → β) → (α → γ). Call it
*funkom*. After the implicit type arguments it should
take two function arguments and return a function as
a result. 
-/

-- Answer below
def funkom {α β γ : Type} : (β → γ) → (α → β) → (α → γ)
| g, f => (fun a => g (f a))

#check funkom

/-! 
## Problem #2

Define a function of the following polymorphic type:
{α β : Type} → (a : α) → (b : β) → α × β. Call it mkop.
-/

-- Answer below

def mkop {α β : Type} : (a : α)  → (b : β) → α × β
| a, b => (a, b)

#eval mkop 5 6
#check mkop

/-! 
## Problem #3

Define a function of the following polymorphic type:
{α β : Type} → α × β → α. Call it op_left.
-/

-- Answer below
def op_left {α β : Type}: (α × β) → α
| (a, _) => a 

#eval op_left (4, 5)

/-! 
## Problem #4

Define a function of the following polymorphic type:
{α β : Type} → α × β → β. Call it op_right.
-/

-- Answer below
def op_right {α β : Type}: α × β → β 
| (_, b) => b 

#eval op_right (4, 5)



/-! 
## Problem #5

Define a data type called *Day*, the values of which
are the names of the seven days of the week: *sunday,
monday,* etc. 

Some days are work days and some days are play
days. Define a data type, *kind*, with two values,
*work* and *play*.

Now define a function, *day2kind*, that takes a *day*
as an argument and returns the *kind* of day it is as
a result. Specify *day2kind* so that weekdays (monday
through friday) are *work* days and weekend days are
*play* days.

Next, define a data type, *reward*, with two values,
*money* and *health*.

Now define a function, *kind2reward*, from *kind* to 
*reward* where *reward work* is *money* and *reward play* 
is *health*.

Finally, use your *funkom* function to produce a new
function that takes a day and returns the corresponding
reward. Call it *day2reward*.

Include test cases using #reduce to show that the reward
from each weekday is *money* and the reward from a weekend
day is *health*.
-/

-- Day was capitalized once early on but later made lowercase in this explanation
-- so I just went with lowercase.
inductive day : Type
| sunday
| monday
| tuesday 
| wednesday
| thursday 
| friday
| saturday
open day

inductive kind : Type
| work 
| play

open kind

def day2kind: day → kind
| sunday => play
| monday => work
| tuesday => work
| wednesday => work
| thursday => work
| friday => work
| saturday => play

#reduce day2kind sunday

inductive reward : Type
| money
| health
open reward

def kind2reward: kind → reward
| work => money
| play => health

def day2reward := funkom kind2reward day2kind

#reduce day2reward saturday --health
#reduce day2reward sunday --health
#reduce day2reward monday --money
#reduce day2reward tuesday --money
#reduce day2reward wednesday --money
#reduce day2reward thursday --money
#reduce day2reward friday --money

/-!
## Problem #6

### A. 
Consider the outputs of the following #check commands. 
-/

#check Nat × Nat × Nat
#check Nat × (Nat × Nat)
#check (Nat × Nat) × Nat

/-!
Is × left associative or right associative? Briefly explain
how you reached your answer.

Answer here: 
× is left associative because adding parenthesis around the last two elements
of the type did not change the data type itself. This is to similar to 
the → operator which is right associative and adding parenthesis to the 
last two elements in a type declaration will not alter the type itself.
When parenthesis were added on the leftmost elements, however, the type
changed to something different, indicating that the × operator 
must be right associative.

### B.
Define a function, *triple*, of the following type:
{ α β γ : Type } → α → β → γ → (α × β × γ)  
-/

-- Here:
def triple { α β γ : Type }: α → β → γ → (α × β × γ)  
| a, b, c => (a, b, c)

/-!
### C.
Define three functions, call them *first*, *second*, 
and *third*, each of which takes any such triple as
an argument and that returns, respectively, its first,
second, or third elements.
-/

def first: (α × β × γ) → α 
| (a, _, _) => a

def second: (α × β × γ) → β 
| (_, b, _) => b

def third: (α × β × γ) → γ 
| (_, _, c) => c

def test := triple "str1" 1 true

#reduce first test
#reduce second test
#reduce third test

-- Here:

/-!
### D.
Write three test cases using #eval to show that when 
you apply each of these "elimination" functions to a
triple (that you can make up) it returns the correct
element of that triple.  
-/

-- Here:

/-!
### E.
Use #check to check the type of a term. that you make 
up, of type (Nat × String) × Bool. The challenge here
is to write a term of that type. 
-/





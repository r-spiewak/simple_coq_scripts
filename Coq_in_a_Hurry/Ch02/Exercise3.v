(* Exercise on counting
Knowing that the Coq system provides a function Nat.eqb to
compare two natural numbers (Nat.eqb n p returns true exactly when n = p),
define a function count_list that takes a natural number and a list and returns
the number of times the natural number occurs in the list.

*)

Require Import Nat.
Require Import List.
Require Import Arith.

Locate "Nat.eqb".

Fixpoint count_list n l :=
    match l with
    | nil => 0
    | a::tl => 
        if Nat.eqb a n
        then 1 + count_list n tl
        else count_list n tl
    end.

Check count_list.

Compute count_list 3 (1::2::3::2::3::4::3::5::nil).
(* 3 *)

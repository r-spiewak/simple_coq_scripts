(* Define a function that takes as input a number n and returns a list with n elements from 0 to n-1.*)

Require Import List.

Fixpoint list_n n :=
    match n with
    | 0 => nil
    | S p => p::nil ++ list_n p
    end.

Check list_n.

Check list_n 5.

Compute list_n 5.

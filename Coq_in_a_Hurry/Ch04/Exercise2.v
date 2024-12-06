(* Exercise on the sum of odd numbers 
The sum of the first n odd natural numbers
is defined with the following function:
Fixpoint sum_odd_n (n:nat) : nat :=
match n with 0 => 0 | S p => 1 + 2 * p + sum_odd_n p end.
Prove the following statement:
forall n:nat, sum_odd_n n = n*n
*)

Require Import PeanoNat.
Require Import Ring.
Require Import ArithRing.

Fixpoint sum_odd_n (n:nat) : nat :=
    match n with
      0 => 0 
    | S p => 1 + 2 * p + sum_odd_n p
    end.

Lemma l1: forall n:nat, sum_odd_n n = n*n.
    Proof.
        induction n.
        reflexivity.
        simpl.
        rewrite IHn.
        rewrite <- plus_n_O.
        rewrite <- mult_n_Sm.
        rewrite PeanoNat.Nat.add_assoc.
        ring_simplify (n+n+n*n).
        ring_simplify (n+n*n+n).
        reflexivity.
    Qed.

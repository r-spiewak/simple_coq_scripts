(* This example demonstrates an interactive proof session, directly from the text. 
Specifically, it shows how to construct a proof that two expressions are equal.*)

Require Import Nat.
Require Import Arith.

Lemma example6 : forall x y, (x + y) * (x + y) = x*x + 2*x*y + y*y.
    Proof.
        intros x y.
        SearchRewrite (_ * (_ + _)).
        rewrite Nat.mul_add_distr_l.
        SearchRewrite ((_ + _) * _).
        rewrite Nat.mul_add_distr_r.
        rewrite Nat.mul_add_distr_r.
        SearchRewrite (_ + (_ + _ )).
        rewrite Nat.add_assoc.
        rewrite <- Nat.add_assoc with (n := x * x).
        SearchPattern (?x * ?y = ?y * ?x).
        rewrite Nat.mul_comm with (n:= y) (m := x).
        SearchRewrite (S _ * _).
        rewrite <- (Nat.mul_1_l (x*y)) at 1.
        rewrite <- Nat.mul_succ_l.
        SearchRewrite (_ * (_ * _)).
        rewrite Nat.mul_assoc.
        reflexivity. (* We're basically saying here the expression on the left is the same as the expression on the right.*)
    Qed.

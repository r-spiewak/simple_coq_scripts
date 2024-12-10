(*Exercise on flatten and size
Prove
Lemma flatten_size : forall t, size (flatten t) = size t.
Hint: you should use flatten aux size, either with the tactic apply or with the
tactic rewrite.
*)

Require Import ArithRing.
(* Require Import Simple_Coq_Scripts.Coq_in_a_Hurry.Ch07.Example1. *)
(* Add LoadPath "Coq_in_a_Hurry/Ch07/Example1". *)
Print LoadPath.
(* From Coq_in_a_Hurry.Ch07 Require Import Example1. *)
From Simple_Coq_Scripts.Coq_in_a_Hurry.Ch07 Require Import Example1.
(* Require Import Simple_Coq_Scripts.Coq_in_a_Hurry.Ch07.Example1. *)

Lemma flatten_size : forall t, size (flatten t) = size t.
    Proof.
        induction t.
        simpl.
        reflexivity.
        simpl.
        rewrite flatten_aux_size.
        simpl.
        rewrite IHt2.
        ring.
    Qed.

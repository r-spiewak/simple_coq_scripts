(* This example is taken directly from the text. 
Additional comments are my own. *)

Require Import ArithRing.
From Simple_Coq_Scripts.Coq_in_a_Hurry.Ch07 Require Import Example1.

Lemma not_subterm_self_l : forall x y, ~ x = N x y.
    Proof. (* We basically want to prove 'not x=N x Y', which then becomes written as 'x <> N x y'. *)
        induction x.
        discriminate.
        intros y abs. (* abs basically introduces a new hypethesis 'fact' which implies false.*)
        injection abs. (* Put the new abs tactic into the conclusion. *)
        intros h2 h1. (* Introduce the two new premises in the conclusion as new hypitheses. *)
        (* h1 contradicts IHx1. We need to change y in IHx1 to x2 in h though. *)
        assert (IHx1' : x1 <> N x1 x2).
        apply IHx1.
        case IHx1'. (* Consider the case where IHx1' in the hypothesis is what makes the conclusion false. *)
        exact h1. (* This conclusion is exactly the hypothesis h1. *)
    Qed.

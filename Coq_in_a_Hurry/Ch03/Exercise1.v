(* Exercise on logical connectives (Exercise 5.6 from [1])
Prove the following theorems:

forall A B C:Prop, A/\(B/\C)->(A/\B)/\C
forall A B C D: Prop,(A->B)/\(C->D)/\A/\C -> B/\D
forall A: Prop, ~(A/\~A)
forall A B C: Prop, A\/(B\/C)->(A\/B)\/C
forall A B: Prop, (A\/B)/\~A -> B

Two benefits can be taken from this exercise. In a first step you should try using
only the basic tactics given in the table page 15. In a second step, you can verify
which of these statements are directly solved by the tactic intuition.
*)

Require Import Setoid.

Lemma prop1: forall A B C: Prop, A/\(B/\C) -> (A/\B)/\C.
    Proof.
        intros A B C.
        (* SearchPattern (_ /\ _).
        rewrite <- conj. *)
        SearchRewrite (_ /\ (_ /\ _)).
        rewrite and_assoc.
        (* reflexivity. *)
        (* intuition. *) (* This works, but is probably cheating... *)
        split. (* Now we have to prove A. *)
        destruct H. (* Break up H from A/\B/\C to A and B/\C. *)
        assumption. (* H is A, and the goal is A. Finish the goal. *)
        split. (* Split the goal B/\C into B and C. *)
        destruct H. (* Split H from A/\B/\C into A and B/\C.*)
        destruct H0. (* Split H0 from B/\C into B and C. *)
        assumption. (* H0 is B and the goal is B. Finish the goal. *)
        destruct H. (* Do the same things for C as for B. *)
        destruct H0.
        assumption.
    Qed.

Lemma prop2: forall A B C D: Prop,(A->B)/\(C->D)/\A/\C -> B/\D.
    Proof.
        intros A B C D.
        (* intuition.*) (*Again, cheating...*)
        split. (* Split goal into B and D. *)
        destruct H. (* The next 3 lines split the hypothesis into 4 parts. *)
        destruct H0.
        destruct H1.
        apply H. (* Apply A->B to H1 (A). *)
        assumption.
        destruct H.
        destruct H0.
        destruct H1.
        apply H0. (* Apply C->D to H2 (C). *)
        assumption.
    Qed.

Lemma prop3: forall A: Prop, ~(A/\~A).
    Proof.
        intros A.
        (* intuition. *) (* Cheating...*)
        intros H. (* Turn the goal into a hypothesis. *)
        destruct H. (* Break it apart, anfd then again. *)
        destruct H0.
        assumption. (* Oh, look, A is A. *)
    Qed.

Lemma prop4: forall A B C: Prop, A\/(B\/C)->(A\/B)\/C.
    Proof.
        intros A B C.
        (* intuition. *)
        intros H.
        rewrite or_assoc.
        destruct H.
        left. (* Of the 3 bits of our goal, use the left one (A).*)
        assumption.
        destruct H.
        right.
        left. (* Get to the middle (B). *)
        assumption.
        right.
        right.
        assumption.
    Qed.

Lemma prop5: forall A B: Prop, (A\/B)/\~A -> B.
    Proof.
        intros A B.
        (* intuition. *)
        intros H.
        destruct H.
        destruct H.
        tauto. (* A and not A is a tautology.*)
        assumption.
    Qed.

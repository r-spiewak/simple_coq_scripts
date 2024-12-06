(*Exercise on universal quantification 
Prove
forall A:Type, forall P Q: A->Prop,
(forall x, P x)\/(forall y, Q y)->forall x, P x\/Q x.
*)

Lemma prop1: forall A:Type, forall P Q: A->Prop,
(forall x, P x)\/(forall y, Q y)->forall x, P x\/Q x.
    Proof.
        intros A P Q.
        intros H.
        destruct H as [H1 | H2].
        left.
        apply H1. (* That's the left side done. Now the right side. *)
        right.
        apply H2.
    Qed.



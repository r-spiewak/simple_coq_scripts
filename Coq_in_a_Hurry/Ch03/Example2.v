(* This example demonstrates an interactive proof session, directly from the text. *)

Lemma example2 : forall a b:Prop, a /\ b -> b /\ a.
    Proof.
        intros a b H. (* Creates a H(ypothesis) based on assuming a and b, and that a /\ b holds true. *)
        split. (* Splits the goal from b /\ a into a and b. *)
        destruct H as [H1 H2]. (* Deconstructs the H in Goal 1 into H1 and H2. *)
        (* intuition. (* Says that the Goal 2 (b) is met by H2 (also b) by intuition. *) *)
        exact H2. (* Not sure exactly, but I guess says that H2 is exactly b, so proves Goal 2? *)
        (* Later, the text suggests this means we want to prove a tactic (b) that is present in the context (H2). *)
        intuition. (* Says that the Goal 1 (a) is met by H1 (also a) by intuition. *)
    Qed. (* No more subgaols or goals, so Lemma is proven, and defined (stored for future use). *)

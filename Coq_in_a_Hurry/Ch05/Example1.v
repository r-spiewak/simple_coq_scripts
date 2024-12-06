(* This example is taken directly from the text. 
Additional comments are my own. *)

Definition is_zero (n:nat) :=
    match n with
      0 => true
    | S p => false
    end.

Lemma not_is_zero_pred : forall x, is_zero x = false -> S (Nat.pred x) = x.
    Proof.
        intros x.
        unfold is_zero, Nat.pred. (* Replace the functions is_zero and pred with their definitions.*)
        destruct x as [ | p]. (* Destruct the two cases (x=0) and x != 0.*)
        discriminate. (* The first subgoal starts with true=false, which isn't true. Get rid of it with discriminate.*)
        intros h. (* Now we have a true hypothesis (false=false), which we can add to our context. *)
        reflexivity. (* Then we have S p = S p, which is true from reflexivity.*)
    Qed.

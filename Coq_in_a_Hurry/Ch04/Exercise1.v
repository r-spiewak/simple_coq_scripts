(*Exercise on addition, alternative definition 
We can define a new addition function
on natural numbers:
Fixpoint add n m := match n with 0 => m | S p => add p (S m) end.
Prove the following statements.
forall n m, add n (S m) = S (add n m)
forall n m, add (S n) m = S (add n m)
forall n m, add n m = n + m
Remember that you may use a lemma you just proved when proving a new exercise.
*)

Fixpoint add n m := 
    match n with 
      0 => m 
    | S p => add p (S m)
    end.

Lemma l1: forall n m, add n (S m) = S (add n m).
    Proof.
        induction n.
        reflexivity. (* The 0 case is easy, since it's just adding 0 on both sides.*)
        simpl.
        firstorder.
    Qed.

Lemma l2: forall n m, add (S n) m = S (add n m).
    Proof.
        apply l1.
    Qed.

Lemma l3: forall n m, add n m = n + m.
    Proof.
        induction n.
        reflexivity.
        simpl.
        firstorder.
        rewrite l1.
        firstorder.
    Qed.

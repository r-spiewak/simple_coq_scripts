(* This example is taken directly from the text. 
Additional comments are my own. *)

Require Import Nat.
Require Import List.
Require Import Arith.

Fixpoint insert n l :=
    match l with
      nil => n::nil
    | a::tl => if n <=? a then n::l else a::insert n tl
    end.

Fixpoint sort l :=
    match l with
      nil => nil
    | a::tl => insert a (sort tl)
    end.

Fixpoint count n l :=
    match l with
      nil => 0
    | a::tl =>
        let r := count n tl in if n =? a then 1+r else r
    end.

Lemma insert_incr : forall n l, count n (insert n l) = 1 + count n l.
    Proof.
        intros n l.
        induction l. (* Do induction on the list.*)
        simpl. (* Simplify. Compute the functions. *)
        rewrite Nat.eqb_refl. (* Replace n =? n with n. *)
        reflexivity.
        simpl.
        case (n <=? a). (* Separate the two cases of (n <= a?) into two subgoals.*)
        simpl.
        rewrite Nat.eqb_refl. (* Again, we have n =? n. Replace it.*)
        reflexivity.
        simpl.
        case (n =? a). (* Now separate the two cases (n =? a).*)
        rewrite IHl. (* Apply the induction hypothesis to the LHS. *)
        reflexivity. (* This works for equating S and 1+ too!*)
        rewrite IHl. (* Again, apply hypothesis to LHS.*)
        reflexivity.
    Qed.

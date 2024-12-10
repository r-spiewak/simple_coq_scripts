(* This example is taken directly from the text. 
Additional comments are my own. *)

Require Import ArithRing.

(* Define inductive type for binary trees. *)
Inductive bin : Type :=
      L : bin (* Leaf node.*)
    | N : bin -> bin -> bin. (* node with two branches.*)

(* Define a bool function whether a node is a leaf node or not.*)
Definition leaf_Q (t : bin): bool :=
    match t with 
        N L L => false 
    | _ => true
    end.

Fixpoint flatten_aux (t1 t2:bin) : bin :=
    match t1 with
      L => N L t2
    | N t'1 t'2 => flatten_aux t'1 (flatten_aux t'2 t2)
    end.

Fixpoint flatten (t:bin) : bin :=
    match t with
      L => L 
    | N t1 t2 => flatten_aux t1 (flatten t2)
    end.

Fixpoint size (t:bin) : nat :=
    match t with
      L => 1 
    | N t1 t2 => 1 + size t1 + size t2
    end.


(* Prove properties of these functions.*)
Lemma node_size : forall t, leaf_Q t = false -> size t = 3.
    Proof.
        intros t.
        destruct t. (* Split t into a Leaf case and a Non-leaf case (based on definition bin with two options). *)
        simpl. (* Since leaf_Q L is true, we get a true=false. Get rid of it.*)
        discriminate.
        destruct t1. (* Split t1 into two subgoals.*)
        destruct t2. (* Split t2 in the first subgoal into two further subgoals.*)
        simpl.
        reflexivity.
        simpl. (* Simplify, and find cases that are impossible (true=fase) so get rid of them.*)
        discriminate.
        simpl.
        discriminate.
    Qed.

Lemma flatten_aux_size : forall t1 t2, size (flatten_aux t1 t2) = size t1 + size t2 + 1.
    Proof.
        induction t1. (* Split into base case and other case.*)
        intros t2. (* Add t2 as a hypothesis to the context.*)
        simpl. (* Simplify expressions. *)
        ring. (* Use ring to simplify S as +1 and accomplish subgoal. *)
        intros t2. (* Introduce t2 as a hypothesis in this context also.*)
        simpl.
        rewrite IHt1_1. (* Rewrite using the first induction hypothesis.*)
        rewrite IHt1_2. (* Same for induction hypothesis 2.*)
        ring. (* There is some additive association, and then show that S is the same as +1. Ring does this for us and accomplishes the goal.*)
    Qed.
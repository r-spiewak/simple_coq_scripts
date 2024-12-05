(* Exercise on sorting
Define a function that takes a list as input and returns true when
it has less than 2 elements or when the first element is smaller than or equal to
the second one. 
Then define a function that takes a list as input and returns true
exactly when this list is sorted (Hint: when the list has at least two elements, the
first element must be smaller than the second element and the tail must be sorted,
use the first function to write the second one).*)

Require Import List.
Require Import Arith.


Locate "_ <=? _".

Definition descending_list l :=
    match l with
    | nil => true
    | a::nil => true
    | a::b::tl => 
        if a <=? b 
        then true 
        else false
    end.

Check descending_list.

Compute descending_list (1::nil).
(* true *)

Compute descending_list (1::2::nil).
(* true *)

Compute descending_list (2::1::nil).
(* false *)


Fixpoint sorted_list l :=
    match l with
    | nil => true
    | a::nil => true
    | a::b::tl => 
        if descending_list (a::b::nil) 
        then sorted_list (tl) 
        else false
    end.

Check sorted_list.

Compute sorted_list (1::2::5::3::nil).
(* false *)

Compute sorted_list (1::3::2::4::nil).
(* true *)
(* But that's wrong! Exactly as I thought, it skips b, since it wouldn't let me put b::tl in the recursive arg!*)

(* Definition sorted_list_new l :=
    Fixpoint sorted_list_new_aux (a: nat) (l: list nat) :=
        match l with
        | nil => true
        | b::tl => 
            if descending_list (a::b::nil)
            then sorted_list_new b::l
            else false 
        end.
    match l with
    | nil => true
    | a::nil => true
    | a::b::tl => sorted_list_new_aux b tl
    end.

Check sorted_list_new. *)

Fixpoint sorted_list_new l :=
    match l with
    | nil => true
    (* | a::nil => true
    | a::b::tl =>  *)
    | a::tl => (* There's really no reason I have to pull off b here, I can just leave it in the list, as I'm passing the list back anyway. *)
        if descending_list (a::tl) 
        then sorted_list_new (tl) 
        else false
    end.

Check sorted_list_new.

Compute sorted_list_new (1::2::5::3::nil).
(* false *)

Compute sorted_list_new (1::3::2::4::nil).
(* false *)

Compute sorted_list_new (1::2::3::4::nil).
(* true *)


(* Write a function that takes 5 arguments and returns their sum.
Use Check to verify the description is well formed.
Use Compute to force computation on a sample of values. *)

Definition sum5 x y z a b := x + y + z + a + b.

Check sum5.

Compute sum5 1 2 3 4 5.

(*Exercise on datatype definition
Define a datatype where there are three cases: a
constant, a case where there are three fields, where the first field is a number and
the next two fields are in the datatype being defined, and a case with four fields,
where the first field is a boolean value and the three other fields are in the datatype
being defined.
*)

Inductive tri : Type :=
    | tri_C
    | tri_N (n : nat) (t1 t2 : tri)
    | tri_B (b : bool) (t1 t2 t3 : tri).

Check tri_N 3 tri_C tri_C.

Check tri_C.

Check tri_B true tri_C tri_C tri_C.


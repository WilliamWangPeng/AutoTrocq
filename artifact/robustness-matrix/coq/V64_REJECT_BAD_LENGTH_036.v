(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_036.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_356 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_356 rest) end.
Theorem bad_length_356 : forall x xs, len_356 (x :: xs) = len_356 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_036.


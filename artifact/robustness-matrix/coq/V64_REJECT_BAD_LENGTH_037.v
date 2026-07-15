(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_037.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_357 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_357 rest) end.
Theorem bad_length_357 : forall x xs, len_357 (x :: xs) = len_357 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_037.


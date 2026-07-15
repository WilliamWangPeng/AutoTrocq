(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_001.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_321 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_321 rest) end.
Theorem bad_length_321 : forall x xs, len_321 (x :: xs) = len_321 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_001.


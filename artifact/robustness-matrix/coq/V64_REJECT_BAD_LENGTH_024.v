(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_024.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_344 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_344 rest) end.
Theorem bad_length_344 : forall x xs, len_344 (x :: xs) = len_344 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_024.


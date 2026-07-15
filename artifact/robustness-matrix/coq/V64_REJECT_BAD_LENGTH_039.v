(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_039.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_359 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_359 rest) end.
Theorem bad_length_359 : forall x xs, len_359 (x :: xs) = len_359 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_039.


(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_004.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_324 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_324 rest) end.
Theorem bad_length_324 : forall x xs, len_324 (x :: xs) = len_324 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_004.


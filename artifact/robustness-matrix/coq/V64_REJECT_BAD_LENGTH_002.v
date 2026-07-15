(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_002.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_322 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_322 rest) end.
Theorem bad_length_322 : forall x xs, len_322 (x :: xs) = len_322 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_002.


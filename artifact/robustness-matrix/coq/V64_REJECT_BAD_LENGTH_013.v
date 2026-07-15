(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_013.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_333 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_333 rest) end.
Theorem bad_length_333 : forall x xs, len_333 (x :: xs) = len_333 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_013.


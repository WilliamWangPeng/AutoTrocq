(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_003.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_323 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_323 rest) end.
Theorem bad_length_323 : forall x xs, len_323 (x :: xs) = len_323 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_003.


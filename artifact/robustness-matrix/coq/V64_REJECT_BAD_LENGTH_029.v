(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_029.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_349 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_349 rest) end.
Theorem bad_length_349 : forall x xs, len_349 (x :: xs) = len_349 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_029.


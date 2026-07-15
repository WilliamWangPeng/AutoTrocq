(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_019.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_339 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_339 rest) end.
Theorem bad_length_339 : forall x xs, len_339 (x :: xs) = len_339 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_019.


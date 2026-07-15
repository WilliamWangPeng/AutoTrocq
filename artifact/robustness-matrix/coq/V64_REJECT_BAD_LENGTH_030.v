(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_030.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_350 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_350 rest) end.
Theorem bad_length_350 : forall x xs, len_350 (x :: xs) = len_350 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_030.


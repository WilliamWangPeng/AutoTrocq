(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_035.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_355 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_355 rest) end.
Theorem bad_length_355 : forall x xs, len_355 (x :: xs) = len_355 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_035.


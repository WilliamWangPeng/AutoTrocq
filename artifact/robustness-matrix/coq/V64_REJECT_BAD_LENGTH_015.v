(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_015.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_335 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_335 rest) end.
Theorem bad_length_335 : forall x xs, len_335 (x :: xs) = len_335 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_015.


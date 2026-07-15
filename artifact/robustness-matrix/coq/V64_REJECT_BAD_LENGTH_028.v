(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_028.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_348 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_348 rest) end.
Theorem bad_length_348 : forall x xs, len_348 (x :: xs) = len_348 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_028.


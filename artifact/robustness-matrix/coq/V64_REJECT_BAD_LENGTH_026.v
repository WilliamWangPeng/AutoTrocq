(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_026.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_346 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_346 rest) end.
Theorem bad_length_346 : forall x xs, len_346 (x :: xs) = len_346 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_026.


(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_032.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_352 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_352 rest) end.
Theorem bad_length_352 : forall x xs, len_352 (x :: xs) = len_352 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_032.


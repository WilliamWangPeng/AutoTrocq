(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_034.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_354 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_354 rest) end.
Theorem bad_length_354 : forall x xs, len_354 (x :: xs) = len_354 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_034.


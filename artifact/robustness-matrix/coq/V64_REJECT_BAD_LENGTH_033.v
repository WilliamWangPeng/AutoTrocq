(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_033.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_353 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_353 rest) end.
Theorem bad_length_353 : forall x xs, len_353 (x :: xs) = len_353 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_033.


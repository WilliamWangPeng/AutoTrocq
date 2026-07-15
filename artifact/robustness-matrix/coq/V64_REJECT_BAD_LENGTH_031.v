(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_031.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_351 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_351 rest) end.
Theorem bad_length_351 : forall x xs, len_351 (x :: xs) = len_351 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_031.


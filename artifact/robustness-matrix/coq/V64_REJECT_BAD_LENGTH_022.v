(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_022.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_342 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_342 rest) end.
Theorem bad_length_342 : forall x xs, len_342 (x :: xs) = len_342 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_022.


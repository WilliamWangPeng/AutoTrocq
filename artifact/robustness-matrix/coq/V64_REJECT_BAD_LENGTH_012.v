(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_012.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_332 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_332 rest) end.
Theorem bad_length_332 : forall x xs, len_332 (x :: xs) = len_332 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_012.


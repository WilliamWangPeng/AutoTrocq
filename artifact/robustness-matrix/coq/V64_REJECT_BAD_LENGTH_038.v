(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_038.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_358 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_358 rest) end.
Theorem bad_length_358 : forall x xs, len_358 (x :: xs) = len_358 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_038.


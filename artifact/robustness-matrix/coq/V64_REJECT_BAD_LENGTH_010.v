(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_010.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_330 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_330 rest) end.
Theorem bad_length_330 : forall x xs, len_330 (x :: xs) = len_330 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_010.


(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_021.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_341 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_341 rest) end.
Theorem bad_length_341 : forall x xs, len_341 (x :: xs) = len_341 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_021.


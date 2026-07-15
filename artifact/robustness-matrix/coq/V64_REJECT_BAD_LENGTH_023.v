(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_023.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_343 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_343 rest) end.
Theorem bad_length_343 : forall x xs, len_343 (x :: xs) = len_343 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_023.


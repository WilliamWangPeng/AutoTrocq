(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_009.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_329 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_329 rest) end.
Theorem bad_length_329 : forall x xs, len_329 (x :: xs) = len_329 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_009.


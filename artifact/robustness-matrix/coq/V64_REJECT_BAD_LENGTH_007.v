(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_007.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_327 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_327 rest) end.
Theorem bad_length_327 : forall x xs, len_327 (x :: xs) = len_327 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_007.


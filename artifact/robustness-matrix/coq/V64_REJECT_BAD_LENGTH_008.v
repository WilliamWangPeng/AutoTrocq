(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_008.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_328 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_328 rest) end.
Theorem bad_length_328 : forall x xs, len_328 (x :: xs) = len_328 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_008.


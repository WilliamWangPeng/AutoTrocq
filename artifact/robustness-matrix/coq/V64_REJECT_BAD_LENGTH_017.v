(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_017.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_337 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_337 rest) end.
Theorem bad_length_337 : forall x xs, len_337 (x :: xs) = len_337 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_017.


(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_011.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_331 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_331 rest) end.
Theorem bad_length_331 : forall x xs, len_331 (x :: xs) = len_331 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_011.


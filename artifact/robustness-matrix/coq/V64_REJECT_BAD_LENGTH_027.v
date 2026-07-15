(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_027.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_347 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_347 rest) end.
Theorem bad_length_347 : forall x xs, len_347 (x :: xs) = len_347 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_027.


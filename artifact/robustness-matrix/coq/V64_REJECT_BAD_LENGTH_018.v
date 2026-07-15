(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_018.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_338 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_338 rest) end.
Theorem bad_length_338 : forall x xs, len_338 (x :: xs) = len_338 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_018.


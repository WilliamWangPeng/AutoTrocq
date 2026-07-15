(* V64 robustness-matrix module *)
Module V64_REJECT_BAD_LENGTH_006.
Require Import Coq.Lists.List.
Import ListNotations.
Fixpoint len_326 (xs : list nat) : nat := match xs with [] => 0 | _ :: rest => S (len_326 rest) end.
Theorem bad_length_326 : forall x xs, len_326 (x :: xs) = len_326 xs.
Proof. intros x xs; reflexivity. Qed.
End V64_REJECT_BAD_LENGTH_006.


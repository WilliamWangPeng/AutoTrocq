(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_028.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_28 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_28 : forall xs : list nat, length (reverse_28 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_28.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_28 : forall xs : list nat, reverse_28 (reverse_28 xs) = xs.
Proof.
  intro xs.
  unfold reverse_28.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_028.


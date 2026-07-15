(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_050.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_50 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_50 : forall xs : list nat, length (reverse_50 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_50.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_50 : forall xs : list nat, reverse_50 (reverse_50 xs) = xs.
Proof.
  intro xs.
  unfold reverse_50.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_050.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_019.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_19 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_19 : forall xs : list nat, length (reverse_19 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_19.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_19 : forall xs : list nat, reverse_19 (reverse_19 xs) = xs.
Proof.
  intro xs.
  unfold reverse_19.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_019.


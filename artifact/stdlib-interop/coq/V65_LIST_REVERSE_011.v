(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_011.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_11 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_11 : forall xs : list nat, length (reverse_11 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_11.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_11 : forall xs : list nat, reverse_11 (reverse_11 xs) = xs.
Proof.
  intro xs.
  unfold reverse_11.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_011.


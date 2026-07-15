(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_012.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_12 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_12 : forall xs : list nat, length (reverse_12 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_12.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_12 : forall xs : list nat, reverse_12 (reverse_12 xs) = xs.
Proof.
  intro xs.
  unfold reverse_12.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_012.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_013.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_13 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_13 : forall xs : list nat, length (reverse_13 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_13.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_13 : forall xs : list nat, reverse_13 (reverse_13 xs) = xs.
Proof.
  intro xs.
  unfold reverse_13.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_013.


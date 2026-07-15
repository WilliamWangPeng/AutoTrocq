(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_029.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_29 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_29 : forall xs : list nat, length (reverse_29 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_29.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_29 : forall xs : list nat, reverse_29 (reverse_29 xs) = xs.
Proof.
  intro xs.
  unfold reverse_29.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_029.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_036.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_36 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_36 : forall xs : list nat, length (reverse_36 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_36.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_36 : forall xs : list nat, reverse_36 (reverse_36 xs) = xs.
Proof.
  intro xs.
  unfold reverse_36.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_036.


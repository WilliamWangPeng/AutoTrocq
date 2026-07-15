(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_014.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_14 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_14 : forall xs : list nat, length (reverse_14 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_14.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_14 : forall xs : list nat, reverse_14 (reverse_14 xs) = xs.
Proof.
  intro xs.
  unfold reverse_14.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_014.


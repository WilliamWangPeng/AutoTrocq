(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_044.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_44 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_44 : forall xs : list nat, length (reverse_44 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_44.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_44 : forall xs : list nat, reverse_44 (reverse_44 xs) = xs.
Proof.
  intro xs.
  unfold reverse_44.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_044.


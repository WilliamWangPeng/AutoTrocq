(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_041.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_41 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_41 : forall xs : list nat, length (reverse_41 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_41.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_41 : forall xs : list nat, reverse_41 (reverse_41 xs) = xs.
Proof.
  intro xs.
  unfold reverse_41.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_041.


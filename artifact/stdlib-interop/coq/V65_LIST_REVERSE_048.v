(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_048.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_48 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_48 : forall xs : list nat, length (reverse_48 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_48.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_48 : forall xs : list nat, reverse_48 (reverse_48 xs) = xs.
Proof.
  intro xs.
  unfold reverse_48.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_048.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_016.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_16 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_16 : forall xs : list nat, length (reverse_16 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_16.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_16 : forall xs : list nat, reverse_16 (reverse_16 xs) = xs.
Proof.
  intro xs.
  unfold reverse_16.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_016.


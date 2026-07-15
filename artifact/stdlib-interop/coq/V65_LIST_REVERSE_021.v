(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_021.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_21 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_21 : forall xs : list nat, length (reverse_21 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_21.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_21 : forall xs : list nat, reverse_21 (reverse_21 xs) = xs.
Proof.
  intro xs.
  unfold reverse_21.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_021.


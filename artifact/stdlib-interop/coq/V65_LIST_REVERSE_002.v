(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_002.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_2 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_2 : forall xs : list nat, length (reverse_2 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_2.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_2 : forall xs : list nat, reverse_2 (reverse_2 xs) = xs.
Proof.
  intro xs.
  unfold reverse_2.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_002.


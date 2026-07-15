(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_010.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_10 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_10 : forall xs : list nat, length (reverse_10 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_10.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_10 : forall xs : list nat, reverse_10 (reverse_10 xs) = xs.
Proof.
  intro xs.
  unfold reverse_10.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_010.


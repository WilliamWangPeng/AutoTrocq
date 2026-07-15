(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_020.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_20 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_20 : forall xs : list nat, length (reverse_20 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_20.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_20 : forall xs : list nat, reverse_20 (reverse_20 xs) = xs.
Proof.
  intro xs.
  unfold reverse_20.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_020.


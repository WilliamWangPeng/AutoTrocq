(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_045.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_45 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_45 : forall xs : list nat, length (reverse_45 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_45.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_45 : forall xs : list nat, reverse_45 (reverse_45 xs) = xs.
Proof.
  intro xs.
  unfold reverse_45.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_045.


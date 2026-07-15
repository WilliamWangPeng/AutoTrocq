(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_026.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_26 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_26 : forall xs : list nat, length (reverse_26 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_26.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_26 : forall xs : list nat, reverse_26 (reverse_26 xs) = xs.
Proof.
  intro xs.
  unfold reverse_26.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_026.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_049.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_49 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_49 : forall xs : list nat, length (reverse_49 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_49.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_49 : forall xs : list nat, reverse_49 (reverse_49 xs) = xs.
Proof.
  intro xs.
  unfold reverse_49.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_049.


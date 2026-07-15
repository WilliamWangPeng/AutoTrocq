(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_040.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_40 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_40 : forall xs : list nat, length (reverse_40 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_40.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_40 : forall xs : list nat, reverse_40 (reverse_40 xs) = xs.
Proof.
  intro xs.
  unfold reverse_40.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_040.


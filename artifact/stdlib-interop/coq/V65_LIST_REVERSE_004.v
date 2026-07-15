(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_004.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_4 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_4 : forall xs : list nat, length (reverse_4 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_4.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_4 : forall xs : list nat, reverse_4 (reverse_4 xs) = xs.
Proof.
  intro xs.
  unfold reverse_4.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_004.


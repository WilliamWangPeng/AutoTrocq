(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_035.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_35 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_35 : forall xs : list nat, length (reverse_35 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_35.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_35 : forall xs : list nat, reverse_35 (reverse_35 xs) = xs.
Proof.
  intro xs.
  unfold reverse_35.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_035.


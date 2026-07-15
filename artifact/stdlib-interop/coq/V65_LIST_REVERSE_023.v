(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_023.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_23 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_23 : forall xs : list nat, length (reverse_23 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_23.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_23 : forall xs : list nat, reverse_23 (reverse_23 xs) = xs.
Proof.
  intro xs.
  unfold reverse_23.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_023.


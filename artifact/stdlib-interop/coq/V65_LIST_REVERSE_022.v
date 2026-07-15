(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_022.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_22 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_22 : forall xs : list nat, length (reverse_22 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_22.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_22 : forall xs : list nat, reverse_22 (reverse_22 xs) = xs.
Proof.
  intro xs.
  unfold reverse_22.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_022.


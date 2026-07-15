(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_008.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_8 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_8 : forall xs : list nat, length (reverse_8 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_8.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_8 : forall xs : list nat, reverse_8 (reverse_8 xs) = xs.
Proof.
  intro xs.
  unfold reverse_8.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_008.


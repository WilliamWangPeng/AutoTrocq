(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_039.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_39 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_39 : forall xs : list nat, length (reverse_39 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_39.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_39 : forall xs : list nat, reverse_39 (reverse_39 xs) = xs.
Proof.
  intro xs.
  unfold reverse_39.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_039.


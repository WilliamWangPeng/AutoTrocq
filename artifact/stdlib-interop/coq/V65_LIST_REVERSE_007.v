(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_007.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_7 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_7 : forall xs : list nat, length (reverse_7 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_7.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_7 : forall xs : list nat, reverse_7 (reverse_7 xs) = xs.
Proof.
  intro xs.
  unfold reverse_7.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_007.


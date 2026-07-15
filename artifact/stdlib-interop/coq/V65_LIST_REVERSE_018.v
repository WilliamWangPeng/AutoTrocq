(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_018.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_18 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_18 : forall xs : list nat, length (reverse_18 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_18.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_18 : forall xs : list nat, reverse_18 (reverse_18 xs) = xs.
Proof.
  intro xs.
  unfold reverse_18.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_018.


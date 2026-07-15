(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_034.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_34 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_34 : forall xs : list nat, length (reverse_34 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_34.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_34 : forall xs : list nat, reverse_34 (reverse_34 xs) = xs.
Proof.
  intro xs.
  unfold reverse_34.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_034.


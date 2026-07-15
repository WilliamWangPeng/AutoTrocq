(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_042.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_42 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_42 : forall xs : list nat, length (reverse_42 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_42.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_42 : forall xs : list nat, reverse_42 (reverse_42 xs) = xs.
Proof.
  intro xs.
  unfold reverse_42.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_042.


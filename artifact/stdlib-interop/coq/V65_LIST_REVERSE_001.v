(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_001.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_1 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_1 : forall xs : list nat, length (reverse_1 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_1.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_1 : forall xs : list nat, reverse_1 (reverse_1 xs) = xs.
Proof.
  intro xs.
  unfold reverse_1.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_001.


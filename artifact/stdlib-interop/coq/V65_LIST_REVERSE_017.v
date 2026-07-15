(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_017.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_17 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_17 : forall xs : list nat, length (reverse_17 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_17.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_17 : forall xs : list nat, reverse_17 (reverse_17 xs) = xs.
Proof.
  intro xs.
  unfold reverse_17.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_017.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_031.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_31 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_31 : forall xs : list nat, length (reverse_31 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_31.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_31 : forall xs : list nat, reverse_31 (reverse_31 xs) = xs.
Proof.
  intro xs.
  unfold reverse_31.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_031.


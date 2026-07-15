(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_027.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_27 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_27 : forall xs : list nat, length (reverse_27 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_27.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_27 : forall xs : list nat, reverse_27 (reverse_27 xs) = xs.
Proof.
  intro xs.
  unfold reverse_27.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_027.


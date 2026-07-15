(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_032.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_32 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_32 : forall xs : list nat, length (reverse_32 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_32.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_32 : forall xs : list nat, reverse_32 (reverse_32 xs) = xs.
Proof.
  intro xs.
  unfold reverse_32.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_032.


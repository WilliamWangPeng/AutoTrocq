(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_003.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_3 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_3 : forall xs : list nat, length (reverse_3 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_3.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_3 : forall xs : list nat, reverse_3 (reverse_3 xs) = xs.
Proof.
  intro xs.
  unfold reverse_3.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_003.


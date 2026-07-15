(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_009.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_9 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_9 : forall xs : list nat, length (reverse_9 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_9.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_9 : forall xs : list nat, reverse_9 (reverse_9 xs) = xs.
Proof.
  intro xs.
  unfold reverse_9.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_009.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_024.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_24 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_24 : forall xs : list nat, length (reverse_24 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_24.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_24 : forall xs : list nat, reverse_24 (reverse_24 xs) = xs.
Proof.
  intro xs.
  unfold reverse_24.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_024.


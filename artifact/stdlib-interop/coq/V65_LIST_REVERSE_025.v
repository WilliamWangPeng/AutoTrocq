(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_025.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_25 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_25 : forall xs : list nat, length (reverse_25 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_25.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_25 : forall xs : list nat, reverse_25 (reverse_25 xs) = xs.
Proof.
  intro xs.
  unfold reverse_25.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_025.


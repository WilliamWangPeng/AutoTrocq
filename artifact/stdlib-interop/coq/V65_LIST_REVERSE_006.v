(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_006.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_6 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_6 : forall xs : list nat, length (reverse_6 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_6.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_6 : forall xs : list nat, reverse_6 (reverse_6 xs) = xs.
Proof.
  intro xs.
  unfold reverse_6.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_006.


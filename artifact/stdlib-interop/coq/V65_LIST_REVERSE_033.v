(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_033.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_33 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_33 : forall xs : list nat, length (reverse_33 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_33.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_33 : forall xs : list nat, reverse_33 (reverse_33 xs) = xs.
Proof.
  intro xs.
  unfold reverse_33.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_033.


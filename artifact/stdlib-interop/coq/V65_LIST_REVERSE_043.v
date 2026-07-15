(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_043.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_43 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_43 : forall xs : list nat, length (reverse_43 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_43.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_43 : forall xs : list nat, reverse_43 (reverse_43 xs) = xs.
Proof.
  intro xs.
  unfold reverse_43.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_043.


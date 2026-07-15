(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_038.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_38 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_38 : forall xs : list nat, length (reverse_38 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_38.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_38 : forall xs : list nat, reverse_38 (reverse_38 xs) = xs.
Proof.
  intro xs.
  unfold reverse_38.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_038.


(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_037.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_37 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_37 : forall xs : list nat, length (reverse_37 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_37.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_37 : forall xs : list nat, reverse_37 (reverse_37 xs) = xs.
Proof.
  intro xs.
  unfold reverse_37.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_037.


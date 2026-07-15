(* V65 standard-library interoperability module *)
(* FAMILY: list-reverse *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_REVERSE_046.
Require Import Coq.Lists.List.
Import ListNotations.

Definition reverse_46 (xs : list nat) : list nat := rev xs.

Theorem reverse_length_46 : forall xs : list nat, length (reverse_46 xs) = length xs.
Proof.
  intro xs.
  unfold reverse_46.
  now rewrite rev_length.
Qed.

Theorem reverse_involutive_46 : forall xs : list nat, reverse_46 (reverse_46 xs) = xs.
Proof.
  intro xs.
  unfold reverse_46.
  now rewrite rev_involutive.
Qed.
End V65_LIST_REVERSE_046.


(* V65 standard-library interoperability module *)
(* FAMILY: list-append *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_APPEND_022.
Require Import Coq.Lists.List.
Import ListNotations.

Definition append_empty_22 (xs : list nat) : list nat := xs ++ [].

Theorem append_empty_correct_22 : forall xs : list nat, append_empty_22 xs = xs.
Proof.
  intro xs.
  unfold append_empty_22.
  now rewrite app_nil_r.
Qed.

Theorem append_empty_length_22 : forall xs : list nat, length (append_empty_22 xs) = length xs.
Proof.
  intro xs.
  rewrite append_empty_correct_22.
  reflexivity.
Qed.
End V65_LIST_APPEND_022.


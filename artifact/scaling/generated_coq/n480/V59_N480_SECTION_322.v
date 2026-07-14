(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_322.
Definition embed_322 (b : bool) : nat := if b then S O else O.
Definition project_322 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_322 : forall b : bool, project_322 (embed_322 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_322.


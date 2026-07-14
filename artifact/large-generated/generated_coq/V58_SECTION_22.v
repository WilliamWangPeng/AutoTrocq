(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_22.
Definition embed_22 (b : bool) : nat := if b then S O else O.
Definition project_22 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_22 : forall b : bool, project_22 (embed_22 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_22.


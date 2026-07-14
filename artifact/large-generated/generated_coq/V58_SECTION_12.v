(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_12.
Definition embed_12 (b : bool) : nat := if b then S O else O.
Definition project_12 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_12 : forall b : bool, project_12 (embed_12 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_12.


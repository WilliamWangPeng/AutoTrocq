(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_57.
Definition embed_57 (b : bool) : nat := if b then S O else O.
Definition project_57 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_57 : forall b : bool, project_57 (embed_57 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_57.


(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_32.
Definition embed_32 (b : bool) : nat := if b then S O else O.
Definition project_32 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_32 : forall b : bool, project_32 (embed_32 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_32.


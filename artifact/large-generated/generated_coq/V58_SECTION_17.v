(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_17.
Definition embed_17 (b : bool) : nat := if b then S O else O.
Definition project_17 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_17 : forall b : bool, project_17 (embed_17 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_17.


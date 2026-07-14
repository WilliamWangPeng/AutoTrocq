(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_47.
Definition embed_47 (b : bool) : nat := if b then S O else O.
Definition project_47 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_47 : forall b : bool, project_47 (embed_47 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_47.


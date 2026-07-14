(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_52.
Definition embed_52 (b : bool) : nat := if b then S O else O.
Definition project_52 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_52 : forall b : bool, project_52 (embed_52 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_52.


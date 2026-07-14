(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_27.
Definition embed_27 (b : bool) : nat := if b then S O else O.
Definition project_27 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_27 : forall b : bool, project_27 (embed_27 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_27.


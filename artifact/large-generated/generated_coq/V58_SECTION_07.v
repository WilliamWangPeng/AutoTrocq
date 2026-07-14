(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_07.
Definition embed_7 (b : bool) : nat := if b then S O else O.
Definition project_7 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_7 : forall b : bool, project_7 (embed_7 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_07.


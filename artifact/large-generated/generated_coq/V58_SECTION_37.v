(* V58 generated module *)
(* CATEGORY: section *)

Module V58_SECTION_37.
Definition embed_37 (b : bool) : nat := if b then S O else O.
Definition project_37 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_37 : forall b : bool, project_37 (embed_37 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V58_SECTION_37.


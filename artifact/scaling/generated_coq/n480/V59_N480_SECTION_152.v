(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_152.
Definition embed_152 (b : bool) : nat := if b then S O else O.
Definition project_152 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_152 : forall b : bool, project_152 (embed_152 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_152.


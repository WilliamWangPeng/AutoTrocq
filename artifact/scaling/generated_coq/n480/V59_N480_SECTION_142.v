(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_142.
Definition embed_142 (b : bool) : nat := if b then S O else O.
Definition project_142 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_142 : forall b : bool, project_142 (embed_142 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_142.


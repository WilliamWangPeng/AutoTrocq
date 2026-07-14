(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_147.
Definition embed_147 (b : bool) : nat := if b then S O else O.
Definition project_147 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_147 : forall b : bool, project_147 (embed_147 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_147.


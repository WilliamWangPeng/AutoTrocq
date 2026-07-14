(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_182.
Definition embed_182 (b : bool) : nat := if b then S O else O.
Definition project_182 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_182 : forall b : bool, project_182 (embed_182 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_182.


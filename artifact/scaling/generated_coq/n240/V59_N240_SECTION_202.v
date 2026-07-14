(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_202.
Definition embed_202 (b : bool) : nat := if b then S O else O.
Definition project_202 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_202 : forall b : bool, project_202 (embed_202 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_202.


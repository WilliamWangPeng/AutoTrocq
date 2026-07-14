(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_282.
Definition embed_282 (b : bool) : nat := if b then S O else O.
Definition project_282 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_282 : forall b : bool, project_282 (embed_282 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_282.


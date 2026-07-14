(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_257.
Definition embed_257 (b : bool) : nat := if b then S O else O.
Definition project_257 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_257 : forall b : bool, project_257 (embed_257 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_257.


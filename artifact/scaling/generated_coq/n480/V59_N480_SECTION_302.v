(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_302.
Definition embed_302 (b : bool) : nat := if b then S O else O.
Definition project_302 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_302 : forall b : bool, project_302 (embed_302 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_302.


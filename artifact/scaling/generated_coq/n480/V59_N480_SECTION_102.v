(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_102.
Definition embed_102 (b : bool) : nat := if b then S O else O.
Definition project_102 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_102 : forall b : bool, project_102 (embed_102 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_102.


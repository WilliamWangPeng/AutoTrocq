(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_162.
Definition embed_162 (b : bool) : nat := if b then S O else O.
Definition project_162 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_162 : forall b : bool, project_162 (embed_162 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_162.


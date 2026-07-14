(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_272.
Definition embed_272 (b : bool) : nat := if b then S O else O.
Definition project_272 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_272 : forall b : bool, project_272 (embed_272 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_272.


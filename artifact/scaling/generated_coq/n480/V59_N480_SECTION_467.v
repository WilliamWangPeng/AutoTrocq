(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_467.
Definition embed_467 (b : bool) : nat := if b then S O else O.
Definition project_467 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_467 : forall b : bool, project_467 (embed_467 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_467.


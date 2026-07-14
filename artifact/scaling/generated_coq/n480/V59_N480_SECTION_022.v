(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_022.
Definition embed_22 (b : bool) : nat := if b then S O else O.
Definition project_22 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_22 : forall b : bool, project_22 (embed_22 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_022.


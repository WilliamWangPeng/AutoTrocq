(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_012.
Definition embed_12 (b : bool) : nat := if b then S O else O.
Definition project_12 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_12 : forall b : bool, project_12 (embed_12 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_012.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_137.
Definition embed_137 (b : bool) : nat := if b then S O else O.
Definition project_137 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_137 : forall b : bool, project_137 (embed_137 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_137.


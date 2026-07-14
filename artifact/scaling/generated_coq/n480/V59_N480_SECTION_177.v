(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_177.
Definition embed_177 (b : bool) : nat := if b then S O else O.
Definition project_177 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_177 : forall b : bool, project_177 (embed_177 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_177.


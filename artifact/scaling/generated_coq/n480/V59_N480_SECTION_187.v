(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_187.
Definition embed_187 (b : bool) : nat := if b then S O else O.
Definition project_187 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_187 : forall b : bool, project_187 (embed_187 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_187.


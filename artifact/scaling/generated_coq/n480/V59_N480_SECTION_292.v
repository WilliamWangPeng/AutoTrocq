(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_292.
Definition embed_292 (b : bool) : nat := if b then S O else O.
Definition project_292 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_292 : forall b : bool, project_292 (embed_292 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_292.


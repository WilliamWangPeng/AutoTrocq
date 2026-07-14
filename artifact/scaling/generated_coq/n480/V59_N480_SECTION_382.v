(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_382.
Definition embed_382 (b : bool) : nat := if b then S O else O.
Definition project_382 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_382 : forall b : bool, project_382 (embed_382 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_382.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_387.
Definition embed_387 (b : bool) : nat := if b then S O else O.
Definition project_387 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_387 : forall b : bool, project_387 (embed_387 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_387.


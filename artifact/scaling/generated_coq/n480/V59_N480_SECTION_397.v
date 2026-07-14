(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_397.
Definition embed_397 (b : bool) : nat := if b then S O else O.
Definition project_397 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_397 : forall b : bool, project_397 (embed_397 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_397.


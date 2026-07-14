(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_392.
Definition embed_392 (b : bool) : nat := if b then S O else O.
Definition project_392 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_392 : forall b : bool, project_392 (embed_392 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_392.


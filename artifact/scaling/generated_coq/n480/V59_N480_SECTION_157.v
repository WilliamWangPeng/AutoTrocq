(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_157.
Definition embed_157 (b : bool) : nat := if b then S O else O.
Definition project_157 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_157 : forall b : bool, project_157 (embed_157 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_157.


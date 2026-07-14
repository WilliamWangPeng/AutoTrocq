(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_242.
Definition embed_242 (b : bool) : nat := if b then S O else O.
Definition project_242 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_242 : forall b : bool, project_242 (embed_242 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_242.


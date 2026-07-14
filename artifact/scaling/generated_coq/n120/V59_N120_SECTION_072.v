(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: section *)

Module V59_N120_SECTION_072.
Definition embed_72 (b : bool) : nat := if b then S O else O.
Definition project_72 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_72 : forall b : bool, project_72 (embed_72 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N120_SECTION_072.


(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_087.
Definition embed_87 (b : bool) : nat := if b then S O else O.
Definition project_87 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_87 : forall b : bool, project_87 (embed_87 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_087.


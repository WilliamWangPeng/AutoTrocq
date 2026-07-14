(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_052.
Definition embed_52 (b : bool) : nat := if b then S O else O.
Definition project_52 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_52 : forall b : bool, project_52 (embed_52 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_052.


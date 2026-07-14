(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_027.
Definition embed_27 (b : bool) : nat := if b then S O else O.
Definition project_27 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_27 : forall b : bool, project_27 (embed_27 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_027.


(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_197.
Definition embed_197 (b : bool) : nat := if b then S O else O.
Definition project_197 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_197 : forall b : bool, project_197 (embed_197 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_197.


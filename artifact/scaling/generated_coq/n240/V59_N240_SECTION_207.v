(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_207.
Definition embed_207 (b : bool) : nat := if b then S O else O.
Definition project_207 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_207 : forall b : bool, project_207 (embed_207 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_207.


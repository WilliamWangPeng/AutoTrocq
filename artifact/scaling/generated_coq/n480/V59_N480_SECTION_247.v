(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_247.
Definition embed_247 (b : bool) : nat := if b then S O else O.
Definition project_247 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_247 : forall b : bool, project_247 (embed_247 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_247.


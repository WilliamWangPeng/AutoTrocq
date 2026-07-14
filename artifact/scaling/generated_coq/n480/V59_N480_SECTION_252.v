(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_252.
Definition embed_252 (b : bool) : nat := if b then S O else O.
Definition project_252 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_252 : forall b : bool, project_252 (embed_252 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_252.


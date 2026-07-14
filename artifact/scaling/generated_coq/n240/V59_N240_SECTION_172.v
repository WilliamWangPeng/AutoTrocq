(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_172.
Definition embed_172 (b : bool) : nat := if b then S O else O.
Definition project_172 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_172 : forall b : bool, project_172 (embed_172 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_172.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_237.
Definition embed_237 (b : bool) : nat := if b then S O else O.
Definition project_237 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_237 : forall b : bool, project_237 (embed_237 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_237.


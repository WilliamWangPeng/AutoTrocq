(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_042.
Definition embed_42 (b : bool) : nat := if b then S O else O.
Definition project_42 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_42 : forall b : bool, project_42 (embed_42 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_042.


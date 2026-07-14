(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_122.
Definition embed_122 (b : bool) : nat := if b then S O else O.
Definition project_122 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_122 : forall b : bool, project_122 (embed_122 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_122.


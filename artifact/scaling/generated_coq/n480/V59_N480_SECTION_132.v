(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_132.
Definition embed_132 (b : bool) : nat := if b then S O else O.
Definition project_132 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_132 : forall b : bool, project_132 (embed_132 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_132.


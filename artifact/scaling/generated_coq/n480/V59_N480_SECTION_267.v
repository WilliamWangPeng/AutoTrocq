(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_267.
Definition embed_267 (b : bool) : nat := if b then S O else O.
Definition project_267 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_267 : forall b : bool, project_267 (embed_267 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_267.


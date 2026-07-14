(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_307.
Definition embed_307 (b : bool) : nat := if b then S O else O.
Definition project_307 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_307 : forall b : bool, project_307 (embed_307 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_307.


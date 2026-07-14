(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_372.
Definition embed_372 (b : bool) : nat := if b then S O else O.
Definition project_372 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_372 : forall b : bool, project_372 (embed_372 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_372.


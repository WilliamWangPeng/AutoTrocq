(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_347.
Definition embed_347 (b : bool) : nat := if b then S O else O.
Definition project_347 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_347 : forall b : bool, project_347 (embed_347 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_347.


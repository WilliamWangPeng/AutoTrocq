(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_432.
Definition embed_432 (b : bool) : nat := if b then S O else O.
Definition project_432 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_432 : forall b : bool, project_432 (embed_432 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_432.


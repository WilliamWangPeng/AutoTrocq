(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_437.
Definition embed_437 (b : bool) : nat := if b then S O else O.
Definition project_437 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_437 : forall b : bool, project_437 (embed_437 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_437.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_477.
Definition embed_477 (b : bool) : nat := if b then S O else O.
Definition project_477 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_477 : forall b : bool, project_477 (embed_477 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_477.


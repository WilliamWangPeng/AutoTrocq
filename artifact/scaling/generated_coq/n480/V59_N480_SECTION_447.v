(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_447.
Definition embed_447 (b : bool) : nat := if b then S O else O.
Definition project_447 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_447 : forall b : bool, project_447 (embed_447 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_447.


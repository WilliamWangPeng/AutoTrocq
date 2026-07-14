(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_422.
Definition embed_422 (b : bool) : nat := if b then S O else O.
Definition project_422 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_422 : forall b : bool, project_422 (embed_422 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_422.


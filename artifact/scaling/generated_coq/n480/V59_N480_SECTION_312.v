(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_312.
Definition embed_312 (b : bool) : nat := if b then S O else O.
Definition project_312 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_312 : forall b : bool, project_312 (embed_312 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_312.


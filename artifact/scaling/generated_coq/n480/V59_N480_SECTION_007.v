(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_007.
Definition embed_7 (b : bool) : nat := if b then S O else O.
Definition project_7 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_7 : forall b : bool, project_7 (embed_7 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_007.


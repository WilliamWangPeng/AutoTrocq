(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_412.
Definition embed_412 (b : bool) : nat := if b then S O else O.
Definition project_412 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_412 : forall b : bool, project_412 (embed_412 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_412.


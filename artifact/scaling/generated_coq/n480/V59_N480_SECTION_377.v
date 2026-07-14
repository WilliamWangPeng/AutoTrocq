(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_377.
Definition embed_377 (b : bool) : nat := if b then S O else O.
Definition project_377 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_377 : forall b : bool, project_377 (embed_377 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_377.


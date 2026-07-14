(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_167.
Definition embed_167 (b : bool) : nat := if b then S O else O.
Definition project_167 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_167 : forall b : bool, project_167 (embed_167 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_167.


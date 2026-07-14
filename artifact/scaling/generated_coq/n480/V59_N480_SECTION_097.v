(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_097.
Definition embed_97 (b : bool) : nat := if b then S O else O.
Definition project_97 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_97 : forall b : bool, project_97 (embed_97 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_097.


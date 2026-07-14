(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_217.
Definition embed_217 (b : bool) : nat := if b then S O else O.
Definition project_217 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_217 : forall b : bool, project_217 (embed_217 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_217.


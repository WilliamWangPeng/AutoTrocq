(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_442.
Definition embed_442 (b : bool) : nat := if b then S O else O.
Definition project_442 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_442 : forall b : bool, project_442 (embed_442 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_442.


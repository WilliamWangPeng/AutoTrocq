(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_317.
Definition embed_317 (b : bool) : nat := if b then S O else O.
Definition project_317 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_317 : forall b : bool, project_317 (embed_317 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_317.


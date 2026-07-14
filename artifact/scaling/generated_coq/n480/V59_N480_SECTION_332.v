(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_332.
Definition embed_332 (b : bool) : nat := if b then S O else O.
Definition project_332 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_332 : forall b : bool, project_332 (embed_332 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_332.


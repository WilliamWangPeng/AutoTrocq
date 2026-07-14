(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_327.
Definition embed_327 (b : bool) : nat := if b then S O else O.
Definition project_327 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_327 : forall b : bool, project_327 (embed_327 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_327.


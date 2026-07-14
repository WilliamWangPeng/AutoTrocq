(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_342.
Definition embed_342 (b : bool) : nat := if b then S O else O.
Definition project_342 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_342 : forall b : bool, project_342 (embed_342 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_342.


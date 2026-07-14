(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_407.
Definition embed_407 (b : bool) : nat := if b then S O else O.
Definition project_407 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_407 : forall b : bool, project_407 (embed_407 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_407.


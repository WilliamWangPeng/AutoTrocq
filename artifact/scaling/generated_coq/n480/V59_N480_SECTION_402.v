(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_402.
Definition embed_402 (b : bool) : nat := if b then S O else O.
Definition project_402 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_402 : forall b : bool, project_402 (embed_402 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_402.


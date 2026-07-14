(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: section *)

Module V59_N120_SECTION_017.
Definition embed_17 (b : bool) : nat := if b then S O else O.
Definition project_17 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_17 : forall b : bool, project_17 (embed_17 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N120_SECTION_017.


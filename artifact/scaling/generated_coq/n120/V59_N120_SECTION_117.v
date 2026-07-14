(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: section *)

Module V59_N120_SECTION_117.
Definition embed_117 (b : bool) : nat := if b then S O else O.
Definition project_117 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_117 : forall b : bool, project_117 (embed_117 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N120_SECTION_117.


(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: section *)

Module V59_N120_SECTION_047.
Definition embed_47 (b : bool) : nat := if b then S O else O.
Definition project_47 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_47 : forall b : bool, project_47 (embed_47 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N120_SECTION_047.


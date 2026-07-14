(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: section *)

Module V59_N120_SECTION_067.
Definition embed_67 (b : bool) : nat := if b then S O else O.
Definition project_67 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_67 : forall b : bool, project_67 (embed_67 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N120_SECTION_067.


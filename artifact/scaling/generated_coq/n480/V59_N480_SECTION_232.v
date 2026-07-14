(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_232.
Definition embed_232 (b : bool) : nat := if b then S O else O.
Definition project_232 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_232 : forall b : bool, project_232 (embed_232 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_232.


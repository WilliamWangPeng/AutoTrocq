(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_297.
Definition embed_297 (b : bool) : nat := if b then S O else O.
Definition project_297 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_297 : forall b : bool, project_297 (embed_297 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_297.


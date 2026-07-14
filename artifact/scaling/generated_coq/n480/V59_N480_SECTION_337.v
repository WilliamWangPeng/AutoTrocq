(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_337.
Definition embed_337 (b : bool) : nat := if b then S O else O.
Definition project_337 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_337 : forall b : bool, project_337 (embed_337 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_337.


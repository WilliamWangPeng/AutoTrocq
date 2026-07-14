(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_287.
Definition embed_287 (b : bool) : nat := if b then S O else O.
Definition project_287 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_287 : forall b : bool, project_287 (embed_287 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_287.


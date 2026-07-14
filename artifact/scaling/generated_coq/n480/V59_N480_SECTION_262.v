(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_262.
Definition embed_262 (b : bool) : nat := if b then S O else O.
Definition project_262 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_262 : forall b : bool, project_262 (embed_262 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_262.


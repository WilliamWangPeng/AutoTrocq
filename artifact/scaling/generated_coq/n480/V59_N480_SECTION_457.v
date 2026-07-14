(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_457.
Definition embed_457 (b : bool) : nat := if b then S O else O.
Definition project_457 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_457 : forall b : bool, project_457 (embed_457 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_457.


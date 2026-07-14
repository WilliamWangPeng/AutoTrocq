(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_367.
Definition embed_367 (b : bool) : nat := if b then S O else O.
Definition project_367 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_367 : forall b : bool, project_367 (embed_367 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_367.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_002.
Definition embed_2 (b : bool) : nat := if b then S O else O.
Definition project_2 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_2 : forall b : bool, project_2 (embed_2 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_002.


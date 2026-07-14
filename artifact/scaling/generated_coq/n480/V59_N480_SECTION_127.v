(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_127.
Definition embed_127 (b : bool) : nat := if b then S O else O.
Definition project_127 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_127 : forall b : bool, project_127 (embed_127 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_127.


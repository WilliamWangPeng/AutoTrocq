(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_082.
Definition embed_82 (b : bool) : nat := if b then S O else O.
Definition project_82 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_82 : forall b : bool, project_82 (embed_82 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_082.


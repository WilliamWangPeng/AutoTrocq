(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_222.
Definition embed_222 (b : bool) : nat := if b then S O else O.
Definition project_222 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_222 : forall b : bool, project_222 (embed_222 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_222.


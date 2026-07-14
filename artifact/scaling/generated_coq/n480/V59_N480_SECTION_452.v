(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_452.
Definition embed_452 (b : bool) : nat := if b then S O else O.
Definition project_452 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_452 : forall b : bool, project_452 (embed_452 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_452.


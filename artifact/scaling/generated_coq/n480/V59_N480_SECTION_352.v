(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_352.
Definition embed_352 (b : bool) : nat := if b then S O else O.
Definition project_352 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_352 : forall b : bool, project_352 (embed_352 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_352.


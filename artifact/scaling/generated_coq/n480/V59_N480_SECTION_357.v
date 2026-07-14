(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_357.
Definition embed_357 (b : bool) : nat := if b then S O else O.
Definition project_357 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_357 : forall b : bool, project_357 (embed_357 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_357.


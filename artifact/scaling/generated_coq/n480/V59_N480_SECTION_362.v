(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_362.
Definition embed_362 (b : bool) : nat := if b then S O else O.
Definition project_362 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_362 : forall b : bool, project_362 (embed_362 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_362.


(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_037.
Definition embed_37 (b : bool) : nat := if b then S O else O.
Definition project_37 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_37 : forall b : bool, project_37 (embed_37 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_037.


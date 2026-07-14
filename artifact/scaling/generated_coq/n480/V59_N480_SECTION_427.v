(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_427.
Definition embed_427 (b : bool) : nat := if b then S O else O.
Definition project_427 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_427 : forall b : bool, project_427 (embed_427 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_427.


(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_057.
Definition embed_57 (b : bool) : nat := if b then S O else O.
Definition project_57 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_57 : forall b : bool, project_57 (embed_57 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_057.


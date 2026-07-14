(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_112.
Definition embed_112 (b : bool) : nat := if b then S O else O.
Definition project_112 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_112 : forall b : bool, project_112 (embed_112 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_112.


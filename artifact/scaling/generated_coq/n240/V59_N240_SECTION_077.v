(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: section *)

Module V59_N240_SECTION_077.
Definition embed_77 (b : bool) : nat := if b then S O else O.
Definition project_77 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_77 : forall b : bool, project_77 (embed_77 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N240_SECTION_077.


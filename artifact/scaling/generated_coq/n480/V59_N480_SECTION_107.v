(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_107.
Definition embed_107 (b : bool) : nat := if b then S O else O.
Definition project_107 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_107 : forall b : bool, project_107 (embed_107 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_107.


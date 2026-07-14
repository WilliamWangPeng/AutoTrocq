(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_062.
Definition embed_62 (b : bool) : nat := if b then S O else O.
Definition project_62 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_62 : forall b : bool, project_62 (embed_62 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_062.


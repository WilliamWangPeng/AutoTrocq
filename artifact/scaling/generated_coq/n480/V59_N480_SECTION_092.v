(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_092.
Definition embed_92 (b : bool) : nat := if b then S O else O.
Definition project_92 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_92 : forall b : bool, project_92 (embed_92 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_092.


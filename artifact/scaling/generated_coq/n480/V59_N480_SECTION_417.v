(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: section *)

Module V59_N480_SECTION_417.
Definition embed_417 (b : bool) : nat := if b then S O else O.
Definition project_417 (n : nat) : bool :=
  match n with
  | O => false
  | S _ => true
  end.

Theorem section_417 : forall b : bool, project_417 (embed_417 b) = b.
Proof.
  destruct b; reflexivity.
Qed.
End V59_N480_SECTION_417.


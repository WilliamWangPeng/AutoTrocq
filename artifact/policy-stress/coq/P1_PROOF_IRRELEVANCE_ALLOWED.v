(* AXIOM_CLASS: proof_irrelevance *)
(* POLICY_EXPECTED: accept *)

Set Implicit Arguments.

Axiom proof_irrelevance_local :
  forall (P : Prop) (p q : P), p = q.

Theorem policy_allows_proof_irrelevance_class :
  forall (P : Prop) (p q : P), p = q.
Proof.
  intros P p q.
  exact (proof_irrelevance_local p q).
Qed.

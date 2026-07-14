(* AXIOM_CLASS: classical_logic *)
(* POLICY_EXPECTED: safe_reject *)

Set Implicit Arguments.

Axiom classic_local : forall P : Prop, P \/ ~ P.

Theorem classical_logic_dependency :
  forall P : Prop, P \/ ~ P.
Proof.
  intro P.
  exact (classic_local P).
Qed.


(* AXIOM_CLASS: functional_extensionality *)
(* POLICY_EXPECTED: safe_reject *)

Set Implicit Arguments.

Axiom functional_extensionality_local :
  forall (A B : Type) (f g : A -> B),
    (forall x : A, f x = g x) -> f = g.

Theorem functional_extensionality_dependency :
  forall (A B : Type) (f g : A -> B),
    (forall x : A, f x = g x) -> f = g.
Proof.
  intros A B f g H.
  exact (functional_extensionality_local f g H).
Qed.


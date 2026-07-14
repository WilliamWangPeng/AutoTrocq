(* AXIOM_CLASS: choice *)
(* POLICY_EXPECTED: safe_reject *)

Set Implicit Arguments.

Axiom choice_local :
  forall (A B : Type) (R : A -> B -> Prop),
    (forall x : A, exists y : B, R x y) ->
    exists f : A -> B, forall x : A, R x (f x).

Theorem choice_dependency :
  forall (A B : Type) (R : A -> B -> Prop),
    (forall x : A, exists y : B, R x y) ->
    exists f : A -> B, forall x : A, R x (f x).
Proof.
  intros A B R H.
  exact (choice_local R H).
Qed.


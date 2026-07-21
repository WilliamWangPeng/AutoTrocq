From Coq Require Import Bool.Bool Lists.List Lia.
Import ListNotations.

Set Implicit Arguments.

Module AutoTrocqOutcomeSemantics.

Section Policy.
  Context {A : Type}.

  Definition subset (X Y : A -> Prop) : Prop :=
    forall x, X x -> Y x.

  Definition admitted (required allowed : A -> Prop) : Prop :=
    subset required allowed.

  Lemma admitted_required_downward
      (required_small required_large allowed : A -> Prop) :
    subset required_small required_large ->
    admitted required_large allowed ->
    admitted required_small allowed.
  Proof.
    intros Hsubset Hadmitted x Hrequired.
    apply Hadmitted, Hsubset, Hrequired.
  Qed.

  Lemma rejection_required_upward
      (required_small required_large allowed : A -> Prop) :
    subset required_small required_large ->
    ~ admitted required_small allowed ->
    ~ admitted required_large allowed.
  Proof.
    intros Hsubset Hrejected Hadmitted.
    apply Hrejected.
    eapply admitted_required_downward; eauto.
  Qed.

  Lemma admitted_allowed_upward
      (required allowed_small allowed_large : A -> Prop) :
    subset allowed_small allowed_large ->
    admitted required allowed_small ->
    admitted required allowed_large.
  Proof.
    intros Hsubset Hadmitted x Hrequired.
    apply Hsubset, Hadmitted, Hrequired.
  Qed.
End Policy.

Inductive outcome : Type :=
| accepted_checked
| policy_blocked
| compile_blocked
| unexpected_failure.

Scheme Equality for outcome.

Record observation : Type := {
  policy_ok : bool;
  expected_negative : bool;
  coqc_ok : bool;
  coqchk_ok : bool
}.

Definition kernel_ok (o : observation) : bool :=
  coqc_ok o && coqchk_ok o.

Definition classify (o : observation) : outcome :=
  if policy_ok o then
    if kernel_ok o then accepted_checked
    else if expected_negative o then compile_blocked
         else unexpected_failure
  else policy_blocked.

Theorem classify_policy_blocked (o : observation) :
  policy_ok o = false -> classify o = policy_blocked.
Proof.
  destruct o; simpl; intros; subst; reflexivity.
Qed.

Theorem classify_accepted_sound (o : observation) :
  classify o = accepted_checked ->
  policy_ok o = true /\ coqc_ok o = true /\ coqchk_ok o = true.
Proof.
  destruct o as [policy negative coqc coqchk].
  destruct policy, negative, coqc, coqchk; simpl; intros; try discriminate; auto.
Qed.

Theorem classify_exhaustive (o : observation) :
  classify o = accepted_checked \/
  classify o = policy_blocked \/
  classify o = compile_blocked \/
  classify o = unexpected_failure.
Proof.
  destruct o as [policy negative coqc coqchk].
  destruct policy, negative, coqc, coqchk; simpl; auto.
Qed.

Theorem outcome_constructors_disjoint :
  accepted_checked <> policy_blocked /\
  accepted_checked <> compile_blocked /\
  accepted_checked <> unexpected_failure /\
  policy_blocked <> compile_blocked /\
  policy_blocked <> unexpected_failure /\
  compile_blocked <> unexpected_failure.
Proof.
  repeat split; discriminate.
Qed.

Fixpoint count_outcome (target : outcome) (xs : list observation) : nat :=
  match xs with
  | [] => 0
  | x :: rest =>
      (if outcome_eq_dec (classify x) target then 1 else 0) +
      count_outcome target rest
  end.

Theorem outcome_partition_count (xs : list observation) :
  length xs =
    count_outcome accepted_checked xs +
    count_outcome policy_blocked xs +
    count_outcome compile_blocked xs +
    count_outcome unexpected_failure xs.
Proof.
  induction xs as [|x xs IH]; simpl; [lia|].
  destruct (classify x); simpl; lia.
Qed.

End AutoTrocqOutcomeSemantics.

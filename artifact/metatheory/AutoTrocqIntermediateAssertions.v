From Coq Require Import Lists.List.
Set Warnings "-masking-absolute-name".
Require Import AutoTrocqComposition AutoTrocqPredicateTransformers.

Set Implicit Arguments.

Module AutoTrocqIntermediateAssertions.

Import AutoTrocqComposition.AutoTrocqComposition.
Import AutoTrocqPredicateTransformers.AutoTrocqPredicateTransformers.

Definition relation_refines {A B : Type}
    (R' R : A -> B -> Prop) : Prop :=
  forall a b, R' a b -> R a b.

Definition intermediate_valid {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) (Q : B -> Prop) : Prop :=
  relation_valid R P Q /\ relation_valid S Q T.

Theorem relation_valid_under_refinement {A B : Type}
    (R' R : A -> B -> Prop) (P : A -> Prop) (Q : B -> Prop) :
  relation_refines R' R ->
  relation_valid R P Q ->
  relation_valid R' P Q.
Proof.
  intros Href Hvalid a b HP HR'.
  apply (Hvalid a b HP), Href, HR'.
Qed.

Theorem weakest_pre_relation_antitone {A B : Type}
    (R' R : A -> B -> Prop) (Q : B -> Prop) :
  relation_refines R' R ->
  pred_subset (weakest_pre R Q) (weakest_pre R' Q).
Proof.
  intros Href a Hwp b HR'.
  apply Hwp, Href, HR'.
Qed.

Theorem strongest_post_relation_monotone {A B : Type}
    (R' R : A -> B -> Prop) (P : A -> Prop) :
  relation_refines R' R ->
  pred_subset (strongest_post R' P) (strongest_post R P).
Proof.
  intros Href b [a [HP HR']].
  exists a; split; [exact HP | apply Href, HR'].
Qed.

Theorem intermediate_valid_iff_interval {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) (Q : B -> Prop) :
  intermediate_valid R S P T Q <->
  pred_subset (strongest_post R P) Q /\
  pred_subset Q (weakest_pre S T).
Proof.
  unfold intermediate_valid.
  rewrite relation_valid_iff_strongest_post.
  rewrite relation_valid_iff_weakest_pre.
  reflexivity.
Qed.

Theorem composite_valid_iff_cut_interval {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) :
  relation_valid (rel_comp R S) P T <->
  pred_subset (strongest_post R P) (weakest_pre S T).
Proof.
  split.
  - intros Hvalid b [a [HP HR]] c HS.
    apply (Hvalid a c HP).
    exists b; split; assumption.
  - intros Hinterval a c HP [b [HR HS]].
    apply (Hinterval b).
    + exists a; split; assumption.
    + exact HS.
Qed.

Theorem composite_valid_iff_intermediate_exists {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) :
  relation_valid (rel_comp R S) P T <->
  exists Q : B -> Prop, intermediate_valid R S P T Q.
Proof.
  split.
  - intro Hvalid.
    exists (weakest_pre S T); split.
    + intros a b HP HR c HS.
      apply (Hvalid a c HP).
      exists b; split; assumption.
    + intros b c Hwp HS; apply (Hwp c HS).
  - intros [Q [Hfirst Hsecond]] a c HP [b [HR HS]].
    apply (Hsecond b c).
    + apply (Hfirst a b); assumption.
    + exact HS.
Qed.

Theorem strongest_intermediate_is_valid {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) :
  relation_valid (rel_comp R S) P T ->
  intermediate_valid R S P T (strongest_post R P).
Proof.
  intro Hvalid; split.
  - intros a b HP HR; exists a; split; assumption.
  - intros b c [a [HP HR]] HS.
    apply (Hvalid a c HP).
    exists b; split; assumption.
Qed.

Theorem weakest_intermediate_is_valid {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) :
  relation_valid (rel_comp R S) P T ->
  intermediate_valid R S P T (weakest_pre S T).
Proof.
  intro Hvalid; split.
  - intros a b HP HR c HS.
    apply (Hvalid a c HP).
    exists b; split; assumption.
  - intros b c Hwp HS; apply (Hwp c HS).
Qed.

Theorem intermediate_assertion_bounds {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) (Q : B -> Prop) :
  intermediate_valid R S P T Q ->
  pred_subset (strongest_post R P) Q /\
  pred_subset Q (weakest_pre S T).
Proof.
  apply intermediate_valid_iff_interval.
Qed.

Theorem composition_conservative_under_refinement {A B C : Type}
    (R' R : A -> B -> Prop) (S' S : B -> C -> Prop)
    (P : A -> Prop) (T : C -> Prop) :
  relation_refines R' R ->
  relation_refines S' S ->
  relation_valid (rel_comp R S) P T ->
  relation_valid (rel_comp R' S') P T.
Proof.
  intros HrefR HrefS Hvalid a c HP [b [HR' HS']].
  apply (Hvalid a c HP).
  exists b; split; [apply HrefR | apply HrefS]; assumption.
Qed.

Section Examples.
  Definition deterministic_first (_ : unit) (b : bool) : Prop := b = false.
  Definition ambiguous_first (_ : unit) (_ : bool) : Prop := True.
  Definition boolean_identity (b c : bool) : Prop := c = b.
  Definition source_true (_ : unit) : Prop := True.
  Definition target_false (c : bool) : Prop := c = false.

  Example deterministic_chain_has_intermediate :
    exists Q : bool -> Prop,
      intermediate_valid deterministic_first boolean_identity
        source_true target_false Q.
  Proof.
    apply composite_valid_iff_intermediate_exists.
    intros a c _ [b [Hb Hc]].
    unfold deterministic_first in Hb.
    unfold boolean_identity in Hc.
    subst; reflexivity.
  Qed.

  Example ambiguous_chain_has_no_intermediate :
    ~ exists Q : bool -> Prop,
        intermediate_valid ambiguous_first boolean_identity
          source_true target_false Q.
  Proof.
    intros [Q [Hfirst Hsecond]].
    assert (HQ : Q true).
    { apply (Hfirst tt true); exact I. }
    specialize (Hsecond true true HQ eq_refl).
    discriminate.
  Qed.
End Examples.

End AutoTrocqIntermediateAssertions.

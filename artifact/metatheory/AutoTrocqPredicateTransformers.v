From Coq Require Import Lists.List.
Set Warnings "-masking-absolute-name".
Require Import AutoTrocqComposition.

Set Implicit Arguments.

Module AutoTrocqPredicateTransformers.

Import AutoTrocqComposition.AutoTrocqComposition.

Definition pred_subset {X : Type} (P Q : X -> Prop) : Prop :=
  forall x, P x -> Q x.

Definition weakest_pre {A B : Type}
    (R : A -> B -> Prop) (Q : B -> Prop) : A -> Prop :=
  fun a => forall b, R a b -> Q b.

Definition strongest_post {A B : Type}
    (R : A -> B -> Prop) (P : A -> Prop) : B -> Prop :=
  fun b => exists a, P a /\ R a b.

Definition relation_valid {A B : Type}
    (R : A -> B -> Prop) (P : A -> Prop) (Q : B -> Prop) : Prop :=
  forall a b, P a -> R a b -> Q b.

Theorem weakest_pre_monotone {A B : Type}
    (R : A -> B -> Prop) (Q Q' : B -> Prop) :
  pred_subset Q Q' ->
  pred_subset (weakest_pre R Q) (weakest_pre R Q').
Proof.
  intros Hsubset a Hpre b HR; apply Hsubset, Hpre, HR.
Qed.

Theorem strongest_post_monotone {A B : Type}
    (R : A -> B -> Prop) (P P' : A -> Prop) :
  pred_subset P P' ->
  pred_subset (strongest_post R P) (strongest_post R P').
Proof.
  intros Hsubset b [a [HP HR]].
  exists a; auto.
Qed.

Theorem weakest_pre_composition_exact {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop) (T : C -> Prop) :
  forall a,
    weakest_pre (rel_comp R S) T a <->
    weakest_pre R (weakest_pre S T) a.
Proof.
  intro a; split.
  - intros H b HR c HS.
    apply H; exists b; auto.
  - intros H c [b [HR HS]].
    apply (H b HR c HS).
Qed.

Theorem strongest_post_composition_exact {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop) (P : A -> Prop) :
  forall c,
    strongest_post (rel_comp R S) P c <->
    strongest_post S (strongest_post R P) c.
Proof.
  intro c; split.
  - intros [a [HP [b [HR HS]]]].
    exists b; split; [exists a; auto | assumption].
  - intros [b [[a [HP HR]] HS]].
    exists a; split; [assumption | exists b; auto].
Qed.

Theorem strongest_post_weakest_pre_galois {A B : Type}
    (R : A -> B -> Prop) (P : A -> Prop) (Q : B -> Prop) :
  pred_subset (strongest_post R P) Q <->
  pred_subset P (weakest_pre R Q).
Proof.
  split.
  - intros H a HP b HR.
    apply H; exists a; auto.
  - intros H b [a [HP HR]].
    apply (H a HP b HR).
Qed.

Theorem relation_valid_iff_weakest_pre {A B : Type}
    (R : A -> B -> Prop) (P : A -> Prop) (Q : B -> Prop) :
  relation_valid R P Q <-> pred_subset P (weakest_pre R Q).
Proof.
  split.
  - intros H a HP b HR; exact (H a b HP HR).
  - intros H a b HP HR; exact (H a HP b HR).
Qed.

Theorem relation_valid_iff_strongest_post {A B : Type}
    (R : A -> B -> Prop) (P : A -> Prop) (Q : B -> Prop) :
  relation_valid R P Q <-> pred_subset (strongest_post R P) Q.
Proof.
  rewrite strongest_post_weakest_pre_galois.
  apply relation_valid_iff_weakest_pre.
Qed.

Theorem weakest_pre_identity {A : Type} (Q : A -> Prop) :
  forall a, weakest_pre eq Q a <-> Q a.
Proof.
  intros a; split.
  - intro H; apply (H a); reflexivity.
  - intros HQ b Heq; subst; assumption.
Qed.

Theorem strongest_post_identity {A : Type} (P : A -> Prop) :
  forall a, strongest_post eq P a <-> P a.
Proof.
  intros a; split.
  - intros [a' [HP Heq]]; subst; assumption.
  - intro HP; exists a; auto.
Qed.

Section CertificateCompleteness.
  Context {Ax A B : Type} {P : A -> Prop} {Q : B -> Prop}.

  Theorem certificate_relation_valid
      (cert : @certificate Ax A B P Q) :
    relation_valid (transfer_relation cert) P Q.
  Proof.
    intros a b HP HR; exact (relation_preserves cert a b HP HR).
  Qed.

  Corollary certificate_weakest_pre_complete
      (cert : @certificate Ax A B P Q) :
    pred_subset P (weakest_pre (transfer_relation cert) Q).
  Proof.
    apply relation_valid_iff_weakest_pre, certificate_relation_valid.
  Qed.

  Corollary certificate_strongest_post_complete
      (cert : @certificate Ax A B P Q) :
    pred_subset (strongest_post (transfer_relation cert) P) Q.
  Proof.
    apply relation_valid_iff_strongest_post, certificate_relation_valid.
  Qed.
End CertificateCompleteness.

Section WeakConditionCounterexample.
  Definition ambiguous_relation (_ : unit) (_ : bool) : Prop := True.
  Definition chosen_transfer (_ : unit) : bool := false.
  Definition target_property (b : bool) : Prop := b = false.

  Example selected_image_satisfies_target :
    target_property (chosen_transfer tt).
  Proof. reflexivity. Qed.

  Example selected_image_is_related :
    ambiguous_relation tt (chosen_transfer tt).
  Proof. exact I. Qed.

  Example ambiguous_relation_is_not_valid :
    ~ relation_valid ambiguous_relation (fun _ => True) target_property.
  Proof.
    intro Hvalid.
    specialize (Hvalid tt true I I).
    discriminate.
  Qed.
End WeakConditionCounterexample.

End AutoTrocqPredicateTransformers.

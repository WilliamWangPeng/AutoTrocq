From Coq Require Import Lists.List.
Set Warnings "-masking-absolute-name".
Require Import AutoTrocqComposition AutoTrocqPredicateTransformers
  AutoTrocqIntermediateAssertions.

Set Implicit Arguments.

Module AutoTrocqFullAbstraction.

Import AutoTrocqComposition.AutoTrocqComposition.
Import AutoTrocqPredicateTransformers.AutoTrocqPredicateTransformers.
Import AutoTrocqIntermediateAssertions.AutoTrocqIntermediateAssertions.

Definition pred_equiv {X : Type} (P Q : X -> Prop) : Prop :=
  forall x, P x <-> Q x.

Definition relation_equiv {A B : Type}
    (R S : A -> B -> Prop) : Prop :=
  forall a b, R a b <-> S a b.

Definition validity_theory_included {A B : Type}
    (R' R : A -> B -> Prop) : Prop :=
  forall (P : A -> Prop) (Q : B -> Prop),
    relation_valid R P Q -> relation_valid R' P Q.

Definition same_validity_theory {A B : Type}
    (R S : A -> B -> Prop) : Prop :=
  forall (P : A -> Prop) (Q : B -> Prop),
    relation_valid R P Q <-> relation_valid S P Q.

Theorem relation_recovered_from_strongest_post {A B : Type}
    (R : A -> B -> Prop) (a : A) (b : B) :
  R a b <-> strongest_post R (fun x => x = a) b.
Proof.
  split.
  - intro HR; exists a; split; [reflexivity | exact HR].
  - intros [x [Hx HR]]; subst; exact HR.
Qed.

Theorem relation_recovered_from_weakest_pre {A B : Type}
    (R : A -> B -> Prop) (a : A) (b : B) :
  R a b <->
  forall Q : B -> Prop, weakest_pre R Q a -> Q b.
Proof.
  split.
  - intros HR Q Hwp; exact (Hwp b HR).
  - intro Hsemantic.
    apply (Hsemantic (fun y => R a y)).
    intros y HR; exact HR.
Qed.

Theorem refinement_iff_validity_theory_inclusion {A B : Type}
    (R' R : A -> B -> Prop) :
  relation_refines R' R <-> validity_theory_included R' R.
Proof.
  split.
  - intros Href P Q Hvalid.
    exact (relation_valid_under_refinement Href Hvalid).
  - intros Htheory a b HR'.
    assert (Hvalid :
      relation_valid R (fun x : A => x = a) (fun y : B => R a y)).
    { intros x y Hx HR; subst; exact HR. }
    exact (Htheory (fun x : A => x = a) (fun y : B => R a y)
      Hvalid a b eq_refl HR').
Qed.

Theorem refinement_iff_strongest_post_order {A B : Type}
    (R' R : A -> B -> Prop) :
  relation_refines R' R <->
  forall P : A -> Prop,
    pred_subset (strongest_post R' P) (strongest_post R P).
Proof.
  split.
  - intros Href P; exact (strongest_post_relation_monotone Href).
  - intros Horder a b HR'.
    apply (proj2 (relation_recovered_from_strongest_post R a b)).
    apply (Horder (fun x => x = a) b).
    apply (proj1 (relation_recovered_from_strongest_post R' a b)).
    exact HR'.
Qed.

Theorem refinement_iff_weakest_pre_order {A B : Type}
    (R' R : A -> B -> Prop) :
  relation_refines R' R <->
  forall Q : B -> Prop,
    pred_subset (weakest_pre R Q) (weakest_pre R' Q).
Proof.
  split.
  - intros Href Q; exact (weakest_pre_relation_antitone Href).
  - intros Horder a b HR'.
    apply (proj2 (relation_recovered_from_weakest_pre R a b)).
    intros Q Hwp.
    exact (Horder Q a Hwp b HR').
Qed.

Theorem relation_equiv_iff_same_validity_theory {A B : Type}
    (R S : A -> B -> Prop) :
  relation_equiv R S <-> same_validity_theory R S.
Proof.
  split.
  - intros Hequiv P Q; split.
    + intros Hvalid a b HP HS.
      apply (Hvalid a b HP), (proj2 (Hequiv a b)), HS.
    + intros Hvalid a b HP HR.
      apply (Hvalid a b HP), (proj1 (Hequiv a b)), HR.
  - intro Htheory.
    assert (HRS : relation_refines R S).
    { apply refinement_iff_validity_theory_inclusion.
      intros P Q; apply (proj2 (Htheory P Q)). }
    assert (HSR : relation_refines S R).
    { apply refinement_iff_validity_theory_inclusion.
      intros P Q; apply (proj1 (Htheory P Q)). }
    intros a b; split; [apply HRS | apply HSR].
Qed.

Theorem relation_equiv_iff_strongest_post_extensional {A B : Type}
    (R S : A -> B -> Prop) :
  relation_equiv R S <->
  forall P : A -> Prop, pred_equiv (strongest_post R P) (strongest_post S P).
Proof.
  split.
  - intros Hequiv P b; split.
    + intros [a [HP HR]]; exists a; split; [exact HP | apply Hequiv, HR].
    + intros [a [HP HS]]; exists a; split; [exact HP | apply Hequiv, HS].
  - intros Hext a b.
    split.
    + intro HR.
      apply (proj2 (relation_recovered_from_strongest_post S a b)).
      apply (proj1 (Hext (fun x => x = a) b)).
      apply (proj1 (relation_recovered_from_strongest_post R a b)).
      exact HR.
    + intro HS.
      apply (proj2 (relation_recovered_from_strongest_post R a b)).
      apply (proj2 (Hext (fun x => x = a) b)).
      apply (proj1 (relation_recovered_from_strongest_post S a b)).
      exact HS.
Qed.

Theorem relation_equiv_iff_weakest_pre_extensional {A B : Type}
    (R S : A -> B -> Prop) :
  relation_equiv R S <->
  forall Q : B -> Prop, pred_equiv (weakest_pre R Q) (weakest_pre S Q).
Proof.
  split.
  - intros Hequiv Q a; split.
    + intros Hwp b HS; apply Hwp, Hequiv, HS.
    + intros Hwp b HR; apply Hwp, Hequiv, HR.
  - intros Hext a b; split.
    + intro HR.
      apply (proj2 (relation_recovered_from_weakest_pre S a b)).
      intros Q HwpS.
      apply (proj2 (Hext Q a)) in HwpS.
      exact (HwpS b HR).
    + intro HS.
      apply (proj2 (relation_recovered_from_weakest_pre R a b)).
      intros Q HwpR.
      apply (proj1 (Hext Q a)) in HwpR.
      exact (HwpR b HS).
Qed.

Theorem missing_edge_has_separating_context {A B : Type}
    (R' R : A -> B -> Prop) (a : A) (b : B) :
  R' a b -> ~ R a b ->
  exists (P : A -> Prop) (Q : B -> Prop),
    relation_valid R P Q /\ ~ relation_valid R' P Q.
Proof.
  intros HR' Hnot.
  exists (fun x => x = a), (fun y => R a y).
  split.
  - intros x y Hx HR; subst; exact HR.
  - intro Hvalid; apply Hnot.
    exact (Hvalid a b eq_refl HR').
Qed.

Theorem relation_refinement_composes {A B C : Type}
    (R' R : A -> B -> Prop) (S' S : B -> C -> Prop) :
  relation_refines R' R -> relation_refines S' S ->
  relation_refines (rel_comp R' S') (rel_comp R S).
Proof.
  intros HrefR HrefS a c [b [HR' HS']].
  exists b; split; [apply HrefR | apply HrefS]; assumption.
Qed.

Theorem contextual_refinement_composes {A B C : Type}
    (R' R : A -> B -> Prop) (S' S : B -> C -> Prop) :
  validity_theory_included R' R ->
  validity_theory_included S' S ->
  validity_theory_included (rel_comp R' S') (rel_comp R S).
Proof.
  intros HctxR HctxS.
  apply (proj1 (refinement_iff_validity_theory_inclusion
    (rel_comp R' S') (rel_comp R S))).
  apply relation_refinement_composes.
  - apply (proj2 (refinement_iff_validity_theory_inclusion R' R)); exact HctxR.
  - apply (proj2 (refinement_iff_validity_theory_inclusion S' S)); exact HctxS.
Qed.

Section SeparatingExamples.
  Definition universal_bool (_ _ : bool) : Prop := True.
  Definition diagonal_bool (x y : bool) : Prop := x = y.

  Example diagonal_refines_universal :
    relation_refines diagonal_bool universal_bool.
  Proof. intros x y _; exact I. Qed.

  Example universal_does_not_refine_diagonal :
    ~ relation_refines universal_bool diagonal_bool.
  Proof.
    intro Href.
    specialize (Href false true I).
    discriminate.
  Qed.

  Example added_edge_is_contextually_visible :
    exists (P Q : bool -> Prop),
      relation_valid diagonal_bool P Q /\
      ~ relation_valid universal_bool P Q.
  Proof.
    apply (missing_edge_has_separating_context
      universal_bool diagonal_bool false true).
    - exact I.
    - discriminate.
  Qed.
End SeparatingExamples.

End AutoTrocqFullAbstraction.

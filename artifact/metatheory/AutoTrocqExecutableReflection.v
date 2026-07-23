From Coq Require Import Bool.Bool Lists.List.

Import ListNotations.
Set Warnings "-masking-absolute-name".
Set Implicit Arguments.

Require Import AutoTrocqComposition.
Require Import AutoTrocqPredicateTransformers.

Module AutoTrocqExecutableReflection.

Import AutoTrocqComposition.AutoTrocqComposition.
Import AutoTrocqPredicateTransformers.AutoTrocqPredicateTransformers.

Fixpoint forallb_list {X : Type} (test : X -> bool) (xs : list X) : bool :=
  match xs with
  | [] => true
  | x :: rest => test x && forallb_list test rest
  end.

Lemma forallb_list_true_iff {X : Type} (test : X -> bool) (xs : list X) :
  forallb_list test xs = true <->
  forall x, In x xs -> test x = true.
Proof.
  induction xs as [|x rest IH]; simpl.
  - split.
    + intros _ y Hy; contradiction.
    + intros _; reflexivity.
  - rewrite andb_true_iff, IH.
    split.
    + intros [Hx Hrest] y [Hy | Hy].
      * subst; exact Hx.
      * apply Hrest; exact Hy.
    + intro Hall; split.
      * apply Hall; left; reflexivity.
      * intros y Hy; apply Hall; right; exact Hy.
Qed.

Definition dec_bool {X : Type}
    (P : X -> Prop) (dec : forall x, {P x} + {~ P x}) (x : X) : bool :=
  if dec x then true else false.

Lemma dec_bool_true_iff {X : Type}
    (P : X -> Prop) (dec : forall x, {P x} + {~ P x}) (x : X) :
  dec_bool P dec x = true <-> P x.
Proof.
  unfold dec_bool.
  destruct (dec x) as [HP | HnotP]; simpl.
  - split; [intros _; exact HP | intros _; reflexivity].
  - split.
    + discriminate.
    + intro HP; exfalso; apply HnotP; exact HP.
Qed.

Definition impliesb (premise conclusion : bool) : bool :=
  negb premise || conclusion.

Lemma impliesb_true_iff (premise conclusion : bool) :
  impliesb premise conclusion = true ->
  premise = true ->
  conclusion = true.
Proof.
  destruct premise, conclusion; simpl; intros; discriminate || reflexivity.
Qed.

Lemma impliesb_complete (premise conclusion : bool) :
  (premise = true -> conclusion = true) ->
  impliesb premise conclusion = true.
Proof.
  destruct premise, conclusion; simpl; intros H; try reflexivity.
  exact (H eq_refl).
Qed.

Section FiniteReflection.
  Context {Ax A B : Type}.
  Variable enumAx : list Ax.
  Variable enumA : list A.
  Variable enumB : list B.
  Hypothesis enumAx_complete : forall ax, In ax enumAx.
  Hypothesis enumA_complete : forall a, In a enumA.
  Hypothesis enumB_complete : forall b, In b enumB.

  Variable P : A -> Prop.
  Variable Q : B -> Prop.
  Variable P_dec : forall a, {P a} + {~ P a}.
  Variable Q_dec : forall b, {Q b} + {~ Q b}.

  Definition check_relation_valid
      (R : A -> B -> Prop)
      (R_dec : forall a b, {R a b} + {~ R a b}) : bool :=
    forallb_list
      (fun a =>
         impliesb (dec_bool P P_dec a)
           (forallb_list
              (fun b =>
                 impliesb (dec_bool (R a) (R_dec a) b)
                   (dec_bool Q Q_dec b))
              enumB))
      enumA.

  Theorem check_relation_valid_reflects
      (R : A -> B -> Prop)
      (R_dec : forall a b, {R a b} + {~ R a b}) :
    check_relation_valid R R_dec = true <->
    relation_valid R P Q.
  Proof.
    unfold check_relation_valid.
    rewrite forallb_list_true_iff.
    split.
    - intros Hcheck a b HP HR.
      specialize (Hcheck a (enumA_complete a)).
      pose proof (proj2 (dec_bool_true_iff P P_dec a) HP) as HPb.
      pose proof (@impliesb_true_iff _ _ Hcheck HPb) as HallB.
      rewrite forallb_list_true_iff in HallB.
      specialize (HallB b (enumB_complete b)).
      pose proof
        (proj2 (dec_bool_true_iff (R a) (R_dec a) b) HR) as HRb.
      pose proof (@impliesb_true_iff _ _ HallB HRb) as HQ.
      apply (proj1 (dec_bool_true_iff Q Q_dec b)); exact HQ.
    - intros Hvalid a Ha.
      apply impliesb_complete; intro HPb.
      rewrite forallb_list_true_iff.
      intros b Hb.
      apply impliesb_complete; intro HRb.
      apply (proj2 (dec_bool_true_iff Q Q_dec b)).
      apply (Hvalid a b).
      + apply (proj1 (dec_bool_true_iff P P_dec a)); exact HPb.
      + apply (proj1 (dec_bool_true_iff (R a) (R_dec a) b)); exact HRb.
  Qed.

  Definition check_selected_related
      (f : A -> B)
      (R : A -> B -> Prop)
      (R_dec : forall a b, {R a b} + {~ R a b}) : bool :=
    forallb_list
      (fun a => dec_bool (R a) (R_dec a) (f a))
      enumA.

  Theorem check_selected_related_reflects
      (f : A -> B)
      (R : A -> B -> Prop)
      (R_dec : forall a b, {R a b} + {~ R a b}) :
    check_selected_related f R R_dec = true <->
    forall a, R a (f a).
  Proof.
    unfold check_selected_related.
    rewrite forallb_list_true_iff.
    split.
    - intros H a.
      apply (proj1 (dec_bool_true_iff (R a) (R_dec a) (f a))).
      apply H, enumA_complete.
    - intros H a Ha.
      apply (proj2 (dec_bool_true_iff (R a) (R_dec a) (f a))).
      apply H.
  Qed.

  Record finite_candidate : Type := {
    candidate_transfer : A -> B;
    candidate_relation : A -> B -> Prop;
    candidate_relation_dec :
      forall a b, {candidate_relation a b} + {~ candidate_relation a b};
    candidate_effect : Ax -> Prop;
    candidate_effect_dec :
      forall ax, {candidate_effect ax} + {~ candidate_effect ax}
  }.

  Definition check_candidate (candidate : finite_candidate) : bool :=
    check_selected_related
      (candidate_transfer candidate)
      (candidate_relation candidate)
      (candidate_relation_dec candidate) &&
    check_relation_valid
      (candidate_relation candidate)
      (candidate_relation_dec candidate).

  Theorem check_candidate_reflects (candidate : finite_candidate) :
    check_candidate candidate = true <->
    (forall a,
        candidate_relation candidate a (candidate_transfer candidate a)) /\
    relation_valid (candidate_relation candidate) P Q.
  Proof.
    unfold check_candidate.
    rewrite andb_true_iff.
    rewrite check_selected_related_reflects.
    rewrite check_relation_valid_reflects.
    tauto.
  Qed.

  Definition materialize_candidate
      (candidate : finite_candidate)
      (checked : check_candidate candidate = true) :
      @certificate Ax A B P Q.
  Proof.
    apply check_candidate_reflects in checked.
    destruct checked as [Hrelated Hvalid].
    refine
      {| transfer := candidate_transfer candidate;
         transfer_relation := candidate_relation candidate;
         transfer_related := Hrelated;
         relation_preserves := Hvalid;
         required_axioms := candidate_effect candidate |}.
  Defined.

  Variable Allowed : Ax -> Prop.
  Variable Allowed_dec : forall ax, {Allowed ax} + {~ Allowed ax}.

  Definition check_admitted (candidate : finite_candidate) : bool :=
    forallb_list
      (fun ax =>
         impliesb
           (dec_bool
              (candidate_effect candidate)
              (candidate_effect_dec candidate)
              ax)
           (dec_bool Allowed Allowed_dec ax))
      enumAx.

  Theorem check_admitted_reflects (candidate : finite_candidate) :
    check_admitted candidate = true <->
    admitted (candidate_effect candidate) Allowed.
  Proof.
    unfold check_admitted, admitted, subset.
    rewrite forallb_list_true_iff.
    split.
    - intros Hcheck ax Hrequired.
      specialize (Hcheck ax (enumAx_complete ax)).
      pose proof
        (proj2
           (dec_bool_true_iff
              (candidate_effect candidate)
              (candidate_effect_dec candidate)
              ax)
           Hrequired) as Hrequiredb.
      pose proof
        (@impliesb_true_iff _ _ Hcheck Hrequiredb) as Hallowed.
      apply (proj1 (dec_bool_true_iff Allowed Allowed_dec ax)); exact Hallowed.
    - intros Hadmitted ax Hax.
      apply impliesb_complete; intro Hrequired.
      apply (proj2 (dec_bool_true_iff Allowed Allowed_dec ax)).
      apply Hadmitted.
      apply
        (proj1
           (dec_bool_true_iff
              (candidate_effect candidate)
              (candidate_effect_dec candidate)
              ax)).
      exact Hrequired.
  Qed.

  Definition check_publishable (candidate : finite_candidate) : bool :=
    check_candidate candidate && check_admitted candidate.

  Theorem check_publishable_reflects (candidate : finite_candidate) :
    check_publishable candidate = true <->
    ((forall a,
        candidate_relation candidate a (candidate_transfer candidate a)) /\
     relation_valid (candidate_relation candidate) P Q) /\
    admitted (candidate_effect candidate) Allowed.
  Proof.
    unfold check_publishable.
    rewrite andb_true_iff.
    rewrite check_candidate_reflects.
    rewrite check_admitted_reflects.
    tauto.
  Qed.

  Corollary checked_candidate_yields_admitted_certificate
      (candidate : finite_candidate) :
    check_publishable candidate = true ->
    exists cert : @certificate Ax A B P Q,
      admitted (required_axioms cert) Allowed /\
      (forall a, transfer cert a = candidate_transfer candidate a) /\
      (forall a b,
          transfer_relation cert a b <->
          candidate_relation candidate a b) /\
      (forall ax,
          required_axioms cert ax <->
          candidate_effect candidate ax).
  Proof.
    intro Hchecked.
    apply check_publishable_reflects in Hchecked.
    destruct Hchecked as [[Hrelated Hvalid] Hadmitted].
    refine
      (ex_intro _
        {| transfer := candidate_transfer candidate;
           transfer_relation := candidate_relation candidate;
           transfer_related := Hrelated;
           relation_preserves := Hvalid;
           required_axioms := candidate_effect candidate |} _).
    simpl.
    split; [exact Hadmitted |].
    split; [intros; reflexivity |].
    split; intros; tauto.
  Qed.
End FiniteReflection.

End AutoTrocqExecutableReflection.

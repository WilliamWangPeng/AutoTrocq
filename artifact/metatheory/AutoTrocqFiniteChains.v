From Coq Require Import Lists.List.
Set Warnings "-masking-absolute-name".
Require Import AutoTrocqComposition AutoTrocqPredicateTransformers
  AutoTrocqIntermediateAssertions AutoTrocqFullAbstraction.

Set Implicit Arguments.

Module AutoTrocqFiniteChains.

Import AutoTrocqComposition.AutoTrocqComposition.
Import AutoTrocqPredicateTransformers.AutoTrocqPredicateTransformers.
Import AutoTrocqIntermediateAssertions.AutoTrocqIntermediateAssertions.

Inductive relation_path : Type -> Type -> Type :=
| path_nil : forall A, relation_path A A
| path_cons : forall A B C,
    (A -> B -> Prop) -> relation_path B C -> relation_path A C.

Arguments path_nil {A}.
Arguments path_cons {A B C} _ _.

Fixpoint path_relation {A C : Type}
    (path : relation_path A C) : A -> C -> Prop :=
  match path in relation_path A0 C0 return A0 -> C0 -> Prop with
  | path_nil => eq
  | path_cons R tail => rel_comp R (path_relation tail)
  end.

Fixpoint path_weakest_pre {A C : Type}
    (path : relation_path A C) (Q : C -> Prop) : A -> Prop :=
  match path in relation_path A0 C0
      return (C0 -> Prop) -> A0 -> Prop with
  | path_nil => fun Q0 => Q0
  | path_cons R tail =>
      fun Q0 => weakest_pre R (path_weakest_pre tail Q0)
  end Q.

Fixpoint path_strongest_post {A C : Type}
    (path : relation_path A C) (P : A -> Prop) : C -> Prop :=
  match path in relation_path A0 C0
      return (A0 -> Prop) -> C0 -> Prop with
  | path_nil => fun P0 => P0
  | path_cons R tail =>
      fun P0 => path_strongest_post tail (strongest_post R P0)
  end P.

Inductive path_cuts :
    forall {A C : Type}, relation_path A C ->
      (A -> Prop) -> (C -> Prop) -> Prop :=
| cuts_nil : forall (A : Type) (P Q : A -> Prop),
    relation_valid eq P Q ->
    path_cuts path_nil P Q
| cuts_cons : forall (A B C : Type)
    (R : A -> B -> Prop) (tail : relation_path B C)
    (P : A -> Prop) (M : B -> Prop) (Q : C -> Prop),
    relation_valid R P M ->
    path_cuts tail M Q ->
    path_cuts (path_cons R tail) P Q.

Theorem path_valid_iff_cuts {A C : Type}
    (path : relation_path A C) (P : A -> Prop) (Q : C -> Prop) :
  relation_valid (path_relation path) P Q <-> path_cuts path P Q.
Proof.
  split.
  - revert P Q.
    induction path as [A | A B C R tail IH]; intros P Q Hvalid.
    + apply cuts_nil; exact Hvalid.
    +
      apply composite_valid_iff_intermediate_exists in Hvalid.
      destruct Hvalid as [M [Hfirst Hrest]].
      eapply cuts_cons; [exact Hfirst |].
      exact (IH M Q Hrest).
  - intro Hcuts.
    induction Hcuts as
      [A0 P0 Q0 Hbase |
       A0 B0 C0 R0 tail0 P0 M Q0 Hfirst Htail IHtail].
    + exact Hbase.
    + intros a c HP [b [HR HS]].
      apply (IHtail b c).
      * apply (Hfirst a b); assumption.
      * exact HS.
Qed.

Theorem path_weakest_pre_exact {A C : Type}
    (path : relation_path A C) (Q : C -> Prop) :
  forall a,
    weakest_pre (path_relation path) Q a <-> path_weakest_pre path Q a.
Proof.
  induction path as [A | A B C R tail IH]; intro a.
  - apply weakest_pre_identity.
  - cbn.
    rewrite weakest_pre_composition_exact.
    split; intros H b HR.
    + apply (proj1 (IH Q b)); exact (H b HR).
    + apply (proj2 (IH Q b)); exact (H b HR).
Qed.

Theorem path_strongest_post_exact {A C : Type}
    (path : relation_path A C) (P : A -> Prop) :
  forall c,
    strongest_post (path_relation path) P c <->
    path_strongest_post path P c.
Proof.
  induction path as [A | A B C R tail IH]; intro c.
  - apply strongest_post_identity.
  - cbn.
    rewrite strongest_post_composition_exact.
    apply IH.
Qed.

Theorem path_valid_iff_weakest_pre {A C : Type}
    (path : relation_path A C) (P : A -> Prop) (Q : C -> Prop) :
  relation_valid (path_relation path) P Q <->
  pred_subset P (path_weakest_pre path Q).
Proof.
  rewrite relation_valid_iff_weakest_pre.
  split; intros H a HP.
  - apply (proj1 (path_weakest_pre_exact path Q a)), H, HP.
  - apply (proj2 (path_weakest_pre_exact path Q a)), H, HP.
Qed.

Theorem path_valid_iff_strongest_post {A C : Type}
    (path : relation_path A C) (P : A -> Prop) (Q : C -> Prop) :
  relation_valid (path_relation path) P Q <->
  pred_subset (path_strongest_post path P) Q.
Proof.
  rewrite relation_valid_iff_strongest_post.
  split; intros H c Hsp.
  - apply H, (proj2 (path_strongest_post_exact path P c)), Hsp.
  - apply H, (proj1 (path_strongest_post_exact path P c)), Hsp.
Qed.

Theorem canonical_backward_cuts {A C : Type}
    (path : relation_path A C) (Q : C -> Prop) :
  path_cuts path (path_weakest_pre path Q) Q.
Proof.
  induction path as [A | A B C R tail IH].
  - apply cuts_nil; intros a b HQ Heq; subst; exact HQ.
  - simpl. eapply cuts_cons with (M := path_weakest_pre tail Q).
    + intros a b Hwp HR; exact (Hwp b HR).
    + exact (IH Q).
Qed.

Theorem canonical_forward_cuts {A C : Type}
    (path : relation_path A C) (P : A -> Prop) :
  path_cuts path P (path_strongest_post path P).
Proof.
  induction path as [A | A B C R tail IH].
  - apply cuts_nil; intros a b HP Heq; subst; exact HP.
  - simpl. eapply cuts_cons with (M := strongest_post R P).
    + intros a b HP HR; unfold strongest_post; exists a; split; assumption.
    + exact (IH (strongest_post R P)).
Qed.

Theorem every_valid_path_has_cuts {A C : Type}
    (path : relation_path A C) (P : A -> Prop) (Q : C -> Prop) :
  relation_valid (path_relation path) P Q -> path_cuts path P Q.
Proof. apply path_valid_iff_cuts. Qed.

Theorem cuts_are_endpoint_sound {A C : Type}
    (path : relation_path A C) (P : A -> Prop) (Q : C -> Prop) :
  path_cuts path P Q -> relation_valid (path_relation path) P Q.
Proof. apply path_valid_iff_cuts. Qed.

Section HeterogeneousExample.
  Definition nat_option (n : nat) (o : option nat) : Prop := o = Some n.
  Definition option_list (o : option nat) (xs : list nat) : Prop :=
    exists n, o = Some n /\ xs = n :: nil.

  Definition heterogeneous_path : relation_path nat (list nat) :=
    path_cons nat_option (path_cons option_list path_nil).

  Definition source_any (_ : nat) : Prop := True.
  Definition target_nonempty (xs : list nat) : Prop := exists n rest, xs = n :: rest.

  Example heterogeneous_path_valid :
    relation_valid (path_relation heterogeneous_path)
      source_any target_nonempty.
  Proof.
    intros n xs _ [o [Ho [m [Hom Hxs]]]].
    unfold nat_option in Ho; subst o.
    unfold option_list in Hom.
    destruct Hom as [k [Hsome Hm]].
    inversion Hsome; subst k.
    subst m.
    exists n, nil; symmetry; exact Hxs.
  Qed.

  Example heterogeneous_path_has_complete_cuts :
    path_cuts heterogeneous_path source_any target_nonempty.
  Proof.
    apply every_valid_path_has_cuts, heterogeneous_path_valid.
  Qed.
End HeterogeneousExample.

End AutoTrocqFiniteChains.

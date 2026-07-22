From Coq Require Import Lists.List.
Set Warnings "-masking-absolute-name".
Require Import AutoTrocqComposition AutoTrocqPredicateTransformers
  AutoTrocqFiniteChains.

Set Implicit Arguments.

Module AutoTrocqCertificateChains.

Import AutoTrocqComposition.AutoTrocqComposition.
Import AutoTrocqPredicateTransformers.AutoTrocqPredicateTransformers.
Import AutoTrocqFiniteChains.AutoTrocqFiniteChains.

Section Chains.
  Context {Ax : Type}.

  Inductive certificate_chain :
      forall (A C : Type), (A -> Prop) -> (C -> Prop) -> Type :=
  | chain_nil : forall (A : Type) (P : A -> Prop),
      @certificate_chain A A P P
  | chain_cons : forall (A B C : Type)
      (P : A -> Prop) (M : B -> Prop) (Q : C -> Prop),
      @certificate Ax A B P M ->
      @certificate_chain B C M Q ->
      @certificate_chain A C P Q.

  Arguments certificate_chain A C P Q.
  Arguments chain_nil {A P}.
  Arguments chain_cons {A B C P M Q} _ _.

  Fixpoint fold_chain {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) : @certificate Ax A C P Q :=
    match chain in @certificate_chain A0 C0 P0 Q0
        return @certificate Ax A0 C0 P0 Q0 with
    | chain_nil => identity_certificate _
    | chain_cons first tail => compose_certificate first (fold_chain tail)
    end.

  Fixpoint chain_relation {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) : relation_path A C :=
    match chain in @certificate_chain A0 C0 _ _
        return relation_path A0 C0 with
    | chain_nil => path_nil
    | chain_cons first tail =>
        path_cons (transfer_relation first) (chain_relation tail)
    end.

  Fixpoint chain_transfer {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) : A -> C :=
    match chain in @certificate_chain A0 C0 _ _ return A0 -> C0 with
    | chain_nil => fun a => a
    | chain_cons first tail =>
        fun a => chain_transfer tail (transfer first a)
    end.

  Fixpoint chain_requires {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) (ax : Ax) : Prop :=
    match chain with
    | chain_nil => False
    | chain_cons first tail =>
        required_axioms first ax \/ chain_requires tail ax
    end.

  Fixpoint stages_admitted {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) (allowed : Ax -> Prop) : Prop :=
    match chain with
    | chain_nil => True
    | chain_cons first tail =>
        admitted (required_axioms first) allowed /\
        stages_admitted tail allowed
    end.

  Fixpoint stages_axiom_free {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) : Prop :=
    match chain with
    | chain_nil => True
    | chain_cons first tail =>
        axiom_free (required_axioms first) /\ stages_axiom_free tail
    end.

  Fixpoint append_chain
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (left : @certificate_chain A B P M)
      (right : @certificate_chain B C M Q) : @certificate_chain A C P Q :=
    match left in @certificate_chain A0 B0 P0 M0
        return @certificate_chain B0 C M0 Q -> @certificate_chain A0 C P0 Q with
    | chain_nil => fun right0 => right0
    | chain_cons first tail =>
        fun right0 => chain_cons first (append_chain tail right0)
    end right.

  Theorem fold_transfer_exact
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    forall a, transfer (fold_chain chain) a = chain_transfer chain a.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH];
      intro a; simpl.
    - reflexivity.
    - apply IH.
  Qed.

  Theorem fold_relation_exact
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    forall a c,
      transfer_relation (fold_chain chain) a c <->
      path_relation (chain_relation chain) a c.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH];
      intros a c; simpl.
    - reflexivity.
    - split.
      + intros [b [Hfirst Htail]].
        exists b; split; [exact Hfirst |].
        apply (proj1 (IH b c)); exact Htail.
      + intros [b [Hfirst Htail]].
        exists b; split; [exact Hfirst |].
        apply (proj2 (IH b c)); exact Htail.
  Qed.

  Theorem folded_chain_related
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    forall a,
      path_relation (chain_relation chain) a (chain_transfer chain a).
  Proof.
    intro a.
    rewrite <- fold_transfer_exact.
    apply (proj1 (fold_relation_exact chain a
      (transfer (fold_chain chain) a))).
    apply transfer_related.
  Qed.

  Theorem folded_chain_preserves
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    forall a, P a -> Q (chain_transfer chain a).
  Proof.
    intros a HP.
    rewrite <- fold_transfer_exact.
    apply certificate_transfer_preserves; exact HP.
  Qed.

  Theorem folded_relation_valid
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    relation_valid (path_relation (chain_relation chain)) P Q.
  Proof.
    intros a c HP HR.
    apply (relation_preserves (fold_chain chain) a c); [exact HP |].
    apply (proj2 (fold_relation_exact chain a c)); exact HR.
  Qed.

  Theorem fold_required_exact
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    forall ax,
      required_axioms (fold_chain chain) ax <-> chain_requires chain ax.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH];
      intro ax; simpl.
    - tauto.
    - change
        (required_axioms first ax \/ required_axioms (fold_chain tail) ax <->
         required_axioms first ax \/ chain_requires tail ax).
      specialize (IH ax); tauto.
  Qed.

  Theorem fold_admitted_exact
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) (allowed : Ax -> Prop) :
    admitted (required_axioms (fold_chain chain)) allowed <->
    stages_admitted chain allowed.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH].
    - change (admitted empty allowed <-> True).
      split; [intro; exact I | intro; apply empty_admitted].
    - change
        (admitted
           (union (required_axioms first)
             (required_axioms (fold_chain tail))) allowed <->
         admitted (required_axioms first) allowed /\
         stages_admitted tail allowed).
      rewrite union_admitted_exact, IH; tauto.
  Qed.

  Theorem fold_axiom_free_exact
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    axiom_free (required_axioms (fold_chain chain)) <->
    stages_axiom_free chain.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH].
    - change (axiom_free (@empty Ax) <-> True).
      split; [intro; exact I | intro; apply empty_axiom_free].
    - change
        (axiom_free
           (union (required_axioms first)
             (required_axioms (fold_chain tail))) <->
         axiom_free (required_axioms first) /\ stages_axiom_free tail).
      rewrite union_axiom_free_exact, IH; tauto.
  Qed.

  Theorem append_transfer_coherent
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (left : @certificate_chain A B P M)
      (right : @certificate_chain B C M Q) :
    forall a,
      transfer (fold_chain (append_chain left right)) a =
      transfer (compose_certificate (fold_chain left) (fold_chain right)) a.
  Proof.
    induction left as [A0 P0 | A0 B0 D0 P0 N0 M0 first tail IH];
      intro a; simpl.
    - reflexivity.
    - rewrite IH; reflexivity.
  Qed.

  Theorem append_relation_coherent
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (left : @certificate_chain A B P M)
      (right : @certificate_chain B C M Q) :
    forall a c,
      transfer_relation (fold_chain (append_chain left right)) a c <->
      transfer_relation
        (compose_certificate (fold_chain left) (fold_chain right)) a c.
  Proof.
    induction left as [A0 P0 | A0 B0 D0 P0 N0 M0 first tail IH];
      intros a c; simpl.
    - symmetry; apply rel_comp_id_left.
    - split.
      + intros [b [Hfirst Hrest]].
        destruct (proj1 (IH right b c) Hrest) as [d [Htail Hright]].
        exists d; split; [exists b; split; assumption | exact Hright].
      + intros [d [[b [Hfirst Htail]] Hright]].
        exists b; split; [exact Hfirst |].
        apply (proj2 (IH right b c)); exists d; split; assumption.
  Qed.

  Theorem append_required_coherent
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (left : @certificate_chain A B P M)
      (right : @certificate_chain B C M Q) :
    forall ax,
      required_axioms (fold_chain (append_chain left right)) ax <->
      required_axioms
        (compose_certificate (fold_chain left) (fold_chain right)) ax.
  Proof.
    induction left as [A0 P0 | A0 B0 D0 P0 N0 M0 first tail IH];
      intro ax.
    - change
        (required_axioms (fold_chain right) ax <->
         False \/ required_axioms (fold_chain right) ax).
      tauto.
    - change
        (required_axioms first ax \/
           required_axioms (fold_chain (append_chain tail right)) ax <->
         (required_axioms first ax \/ required_axioms (fold_chain tail) ax) \/
           required_axioms (fold_chain right) ax).
      specialize (IH right ax).
      change
        (required_axioms (fold_chain (append_chain tail right)) ax <->
         required_axioms (fold_chain tail) ax \/
           required_axioms (fold_chain right) ax) in IH.
      tauto.
  Qed.

  Definition certificate_equiv
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (left right : @certificate Ax A C P Q) : Prop :=
    (forall a, transfer left a = transfer right a) /\
    (forall a c,
      transfer_relation left a c <-> transfer_relation right a c) /\
    (forall ax,
      required_axioms left ax <-> required_axioms right ax).

  Theorem certificate_equiv_reflexive
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (cert : @certificate Ax A C P Q) :
    certificate_equiv cert cert.
  Proof.
    unfold certificate_equiv.
    split.
    - intro x; reflexivity.
    - split.
      + intros x y; reflexivity.
      + intro ax0; reflexivity.
  Qed.

  Theorem certificate_equiv_symmetric
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (left right : @certificate Ax A C P Q) :
    certificate_equiv left right -> certificate_equiv right left.
  Proof.
    intros [Htransfer [Hrelation Hrequired]].
    unfold certificate_equiv.
    split.
    - intro x; symmetry; apply Htransfer.
    - split.
      + intros x y; symmetry; apply Hrelation.
      + intro ax0; symmetry; apply Hrequired.
  Qed.

  Theorem certificate_equiv_transitive
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (first second third : @certificate Ax A C P Q) :
    certificate_equiv first second ->
    certificate_equiv second third ->
    certificate_equiv first third.
  Proof.
    intros [Htransfer12 [Hrelation12 Hrequired12]]
      [Htransfer23 [Hrelation23 Hrequired23]].
    unfold certificate_equiv.
    split.
    - intro x; rewrite Htransfer12; apply Htransfer23.
    - split.
      + intros x y; rewrite Hrelation12; apply Hrelation23.
      + intro ax0; rewrite Hrequired12; apply Hrequired23.
  Qed.

  Theorem composition_respects_certificate_equiv
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (first first' : @certificate Ax A B P M)
      (second second' : @certificate Ax B C M Q) :
    certificate_equiv first first' ->
    certificate_equiv second second' ->
    certificate_equiv
      (compose_certificate first second)
      (compose_certificate first' second').
  Proof.
    intros [Htransfer1 [Hrelation1 Hrequired1]]
      [Htransfer2 [Hrelation2 Hrequired2]].
    unfold certificate_equiv.
    split.
    - intro a; simpl. rewrite Htransfer1, Htransfer2; reflexivity.
    - split.
      + intros a c; simpl; split.
        * intros [b [Hfirst Hsecond]].
          exists b; split.
          -- apply (proj1 (Hrelation1 a b)); exact Hfirst.
          -- apply (proj1 (Hrelation2 b c)); exact Hsecond.
        * intros [b [Hfirst Hsecond]].
          exists b; split.
          -- apply (proj2 (Hrelation1 a b)); exact Hfirst.
          -- apply (proj2 (Hrelation2 b c)); exact Hsecond.
      + intro ax; simpl; split.
        * intros [Hfirst | Hsecond].
          -- left; apply (proj1 (Hrequired1 ax)); exact Hfirst.
          -- right; apply (proj1 (Hrequired2 ax)); exact Hsecond.
        * intros [Hfirst | Hsecond].
          -- left; apply (proj2 (Hrequired1 ax)); exact Hfirst.
          -- right; apply (proj2 (Hrequired2 ax)); exact Hsecond.
  Qed.

  Theorem fold_append_functorial
      {A B C : Type}
      {P : A -> Prop} {M : B -> Prop} {Q : C -> Prop}
      (left : @certificate_chain A B P M)
      (right : @certificate_chain B C M Q) :
    certificate_equiv
      (fold_chain (append_chain left right))
      (compose_certificate (fold_chain left) (fold_chain right)).
  Proof.
    unfold certificate_equiv.
    split.
    - apply append_transfer_coherent.
    - split.
      + apply append_relation_coherent.
      + apply append_required_coherent.
  Qed.

  Theorem fold_empty_preserves_identity
      {A : Type} (P : A -> Prop) :
    certificate_equiv
      (fold_chain (@chain_nil A P))
      (identity_certificate P).
  Proof. apply certificate_equiv_reflexive. Qed.

  Theorem append_associative
      {A B C D : Type}
      {P : A -> Prop} {Q : B -> Prop}
      {R : C -> Prop} {S : D -> Prop}
      (ab : @certificate_chain A B P Q)
      (bc : @certificate_chain B C Q R)
      (cd : @certificate_chain C D R S) :
    append_chain (append_chain ab bc) cd =
    append_chain ab (append_chain bc cd).
  Proof.
    induction ab as [A0 P0 | A0 B0 E0 P0 M0 Q0 first tail IH]; simpl.
    - reflexivity.
    - f_equal; apply IH.
  Qed.

  Theorem append_identity_left
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    append_chain chain_nil chain = chain.
  Proof. reflexivity. Qed.

  Theorem append_identity_right
      {A C : Type} {P : A -> Prop} {Q : C -> Prop}
      (chain : @certificate_chain A C P Q) :
    append_chain chain chain_nil = chain.
  Proof.
    induction chain as [A0 P0 | A0 B0 C0 P0 M0 Q0 first tail IH]; simpl.
    - reflexivity.
    - f_equal; exact IH.
  Qed.

End Chains.

Section HeterogeneousCertificateExample.
  Import AutoTrocqComposition.AutoTrocqComposition.

  Definition example_chain :
      @certificate_chain axiom_name nat (list nat) positive nonempty :=
    chain_cons nat_to_option
      (chain_cons option_to_list
        (@chain_nil axiom_name (list nat) nonempty)).

  Example example_chain_preserves :
    forall n, positive n -> nonempty (chain_transfer example_chain n).
  Proof. apply folded_chain_preserves. Qed.

  Example example_chain_is_axiom_free :
    stages_axiom_free example_chain.
  Proof.
    simpl; repeat split; apply empty_axiom_free.
  Qed.

  Example example_chain_endpoint_related :
    forall n,
      path_relation (chain_relation example_chain) n
        (chain_transfer example_chain n).
  Proof. apply folded_chain_related. Qed.
End HeterogeneousCertificateExample.

End AutoTrocqCertificateChains.

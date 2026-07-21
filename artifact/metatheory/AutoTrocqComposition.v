From Coq Require Import Lists.List.

Set Implicit Arguments.

Module AutoTrocqComposition.

Section Sets.
  Context {X : Type}.

  Definition subset (P Q : X -> Prop) : Prop :=
    forall x, P x -> Q x.

  Definition union (P Q : X -> Prop) : X -> Prop :=
    fun x => P x \/ Q x.

  Definition empty : X -> Prop := fun _ => False.

  Definition admitted (required allowed : X -> Prop) : Prop :=
    subset required allowed.

  Definition axiom_free (required : X -> Prop) : Prop :=
    forall x, ~ required x.

  Lemma union_admitted_exact (P Q allowed : X -> Prop) :
    admitted (union P Q) allowed <->
    admitted P allowed /\ admitted Q allowed.
  Proof.
    split.
    - intro H; split; intros x Hx; apply H; [left | right]; assumption.
    - intros [HP HQ] x [Hx | Hx]; [apply HP | apply HQ]; assumption.
  Qed.

  Lemma union_axiom_free_exact (P Q : X -> Prop) :
    axiom_free (union P Q) <-> axiom_free P /\ axiom_free Q.
  Proof.
    split.
    - intro H; split; intros x Hx; apply (H x); [left | right]; assumption.
    - intros [HP HQ] x [Hx | Hx]; [apply (HP x) | apply (HQ x)]; assumption.
  Qed.

  Lemma empty_admitted (allowed : X -> Prop) : admitted empty allowed.
  Proof. intros x H; contradiction. Qed.

  Lemma empty_axiom_free : axiom_free empty.
  Proof. intros x H; contradiction. Qed.
End Sets.

Definition rel_comp {A B C : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop) : A -> C -> Prop :=
  fun a c => exists b, R a b /\ S b c.

Lemma rel_comp_assoc {A B C D : Type}
    (R : A -> B -> Prop) (S : B -> C -> Prop) (T : C -> D -> Prop) :
  forall a d,
    rel_comp R (rel_comp S T) a d <->
    rel_comp (rel_comp R S) T a d.
Proof.
  intros a d; split.
  - intros [b [HR [c [HS HT]]]].
    exists c; split; [exists b; auto | assumption].
  - intros [c [[b [HR HS]] HT]].
    exists b; split; [assumption | exists c; auto].
Qed.

Lemma rel_comp_id_left {A B : Type} (R : A -> B -> Prop) :
  forall a b, rel_comp eq R a b <-> R a b.
Proof.
  intros a b; split.
  - intros [a' [Heq HR]]; subst; assumption.
  - intro HR; exists a; auto.
Qed.

Lemma rel_comp_id_right {A B : Type} (R : A -> B -> Prop) :
  forall a b, rel_comp R eq a b <-> R a b.
Proof.
  intros a b; split.
  - intros [b' [HR Heq]]; subst; assumption.
  - intro HR; exists b; auto.
Qed.

Section Certificates.
  Context {Ax : Type}.

  Record certificate
      (A B : Type) (Pre : A -> Prop) (Post : B -> Prop) : Type := {
    transfer : A -> B;
    transfer_relation : A -> B -> Prop;
    transfer_related : forall a, transfer_relation a (transfer a);
    transfer_preserves : forall a, Pre a -> Post (transfer a);
    required_axioms : Ax -> Prop
  }.

  Arguments transfer {A B Pre Post} _ _.
  Arguments transfer_relation {A B Pre Post} _ _ _.
  Arguments transfer_related {A B Pre Post} _ _.
  Arguments transfer_preserves {A B Pre Post} _ _ _.
  Arguments required_axioms {A B Pre Post} _ _.

  Definition identity_certificate {A : Type} (P : A -> Prop) :
      @certificate A A P P.
  Proof.
    refine {| transfer := fun a => a;
              transfer_relation := eq;
              required_axioms := empty |}.
    - intro a; reflexivity.
    - auto.
  Defined.

  Definition compose_certificate
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post) :
      @certificate A C Pre Post.
  Proof.
    refine
      {| transfer := fun a => transfer second (transfer first a);
         transfer_relation :=
           rel_comp (transfer_relation first) (transfer_relation second);
         required_axioms :=
           union (required_axioms first) (required_axioms second) |}.
    - intro a.
      exists (transfer first a); split; apply transfer_related.
    - intros a Hpre.
      apply transfer_preserves, transfer_preserves, Hpre.
  Defined.

  Theorem composition_preserves
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post) :
    forall a, Pre a -> Post (transfer (compose_certificate first second) a).
  Proof. apply transfer_preserves. Qed.

  Theorem composition_related
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post) :
    forall a,
      rel_comp (transfer_relation first) (transfer_relation second) a
        (transfer (compose_certificate first second) a).
  Proof.
    intro a; exists (transfer first a); split.
    - exact (transfer_related first a).
    - exact (transfer_related second (transfer first a)).
  Qed.

  Theorem composition_admitted_exact
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post)
      (allowed : Ax -> Prop) :
    admitted (required_axioms (compose_certificate first second)) allowed <->
    admitted (required_axioms first) allowed /\
    admitted (required_axioms second) allowed.
  Proof. apply union_admitted_exact. Qed.

  Corollary composition_admitted
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post)
      (allowed : Ax -> Prop) :
    admitted (required_axioms first) allowed ->
    admitted (required_axioms second) allowed ->
    admitted (required_axioms (compose_certificate first second)) allowed.
  Proof.
    intros Hfirst Hsecond.
    apply composition_admitted_exact; auto.
  Qed.

  Theorem composition_axiom_free_exact
      {A B C : Type} {Pre : A -> Prop} {Mid : B -> Prop} {Post : C -> Prop}
      (first : @certificate A B Pre Mid)
      (second : @certificate B C Mid Post) :
    axiom_free (required_axioms (compose_certificate first second)) <->
    axiom_free (required_axioms first) /\
    axiom_free (required_axioms second).
  Proof. apply union_axiom_free_exact. Qed.

  Theorem composition_transfer_assoc
      {A B C D : Type}
      {P : A -> Prop} {Q : B -> Prop} {R : C -> Prop} {S : D -> Prop}
      (ab : @certificate A B P Q)
      (bc : @certificate B C Q R)
      (cd : @certificate C D R S) :
    forall a,
      transfer (compose_certificate (compose_certificate ab bc) cd) a =
      transfer (compose_certificate ab (compose_certificate bc cd)) a.
  Proof. reflexivity. Qed.

  Theorem composition_relation_assoc
      {A B C D : Type}
      {P : A -> Prop} {Q : B -> Prop} {R : C -> Prop} {S : D -> Prop}
      (ab : @certificate A B P Q)
      (bc : @certificate B C Q R)
      (cd : @certificate C D R S) :
    forall a d,
      transfer_relation (compose_certificate ab (compose_certificate bc cd)) a d <->
      transfer_relation (compose_certificate (compose_certificate ab bc) cd) a d.
  Proof. apply rel_comp_assoc. Qed.

  Theorem composition_required_assoc
      {A B C D : Type}
      {P : A -> Prop} {Q : B -> Prop} {R : C -> Prop} {S : D -> Prop}
      (ab : @certificate A B P Q)
      (bc : @certificate B C Q R)
      (cd : @certificate C D R S) :
    forall ax,
      required_axioms
        (compose_certificate (compose_certificate ab bc) cd) ax <->
      required_axioms
        (compose_certificate ab (compose_certificate bc cd)) ax.
  Proof.
    intro ax.
    change
      (((required_axioms ab ax \/ required_axioms bc ax) \/
        required_axioms cd ax) <->
       (required_axioms ab ax \/
        (required_axioms bc ax \/ required_axioms cd ax))).
    tauto.
  Qed.

  Theorem identity_left_transfer
      {A B : Type} {P : A -> Prop} {Q : B -> Prop}
      (ab : @certificate A B P Q) :
    forall a,
      transfer (compose_certificate (identity_certificate P) ab) a =
      transfer ab a.
  Proof. reflexivity. Qed.

  Theorem identity_right_transfer
      {A B : Type} {P : A -> Prop} {Q : B -> Prop}
      (ab : @certificate A B P Q) :
    forall a,
      transfer (compose_certificate ab (identity_certificate Q)) a =
      transfer ab a.
  Proof. reflexivity. Qed.
End Certificates.

Section ConcreteChain.
  Inductive axiom_name := funext | propext.

  Definition positive (n : nat) : Prop := exists k, n = S k.
  Definition present (o : option nat) : Prop := exists n, o = Some n.
  Definition nonempty (xs : list nat) : Prop := exists n rest, xs = n :: rest.

  Definition nat_to_option :
      @certificate axiom_name nat (option nat) positive present.
  Proof.
    refine {| transfer := @Some nat;
              transfer_relation := fun n o => o = Some n;
              required_axioms := empty |}.
    - reflexivity.
    - intros n _; exists n; reflexivity.
  Defined.

  Definition option_to_list :
      @certificate axiom_name (option nat) (list nat) present nonempty.
  Proof.
    refine {| transfer := fun o => match o with Some n => n :: nil | None => nil end;
              transfer_relation := fun o xs =>
                match o with Some n => xs = n :: nil | None => xs = nil end;
              required_axioms := empty |}.
    - intro o; destruct o; reflexivity.
    - intros o [n Ho]; subst o.
      exists n, nil; reflexivity.
  Defined.

  Example concrete_chain_preserves :
    forall n, positive n ->
      nonempty (transfer (compose_certificate nat_to_option option_to_list) n).
  Proof. apply composition_preserves. Qed.

  Example concrete_chain_axiom_free :
    axiom_free
      (required_axioms (compose_certificate nat_to_option option_to_list)).
  Proof.
    apply composition_axiom_free_exact; split; apply empty_axiom_free.
  Qed.
End ConcreteChain.

End AutoTrocqComposition.

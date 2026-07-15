From Coq Require Import Lists.List.
Import ListNotations.

(* Seed-family replay: lists over refined elements. *)

Section RefinedLists.
  Variables A B : Type.
  Variable refine : A -> B.
  Variable valid : B -> Prop.
  Hypothesis refine_valid : forall x, valid (refine x).

  Inductive elem_rel : A -> B -> Prop :=
  | elem_rel_refine : forall x, elem_rel x (refine x).

  Inductive list_rel : list A -> list B -> Prop :=
  | list_rel_nil : list_rel [] []
  | list_rel_cons :
      forall x y xs ys,
        elem_rel x y ->
        list_rel xs ys ->
        list_rel (x :: xs) (y :: ys).

  Lemma map_refine_related :
    forall xs, list_rel xs (map refine xs).
  Proof.
    induction xs as [|x xs IH].
    - constructor.
    - simpl. constructor; [constructor | exact IH].
  Qed.

  Lemma related_target_valid :
    forall xs ys,
      list_rel xs ys ->
      Forall valid ys.
  Proof.
    intros xs ys H.
    induction H.
    - constructor.
    - inversion H; subst.
      constructor.
      + apply refine_valid.
      + exact IHlist_rel.
  Qed.
End RefinedLists.

From Coq Require Import Lists.List.
Import ListNotations.

(* Minimal kernel-candidate witness for D2-LIST-RET-005.
   It checks relation-polymorphic list transfer under a retraction-style
   element relation. *)

Section ListRetractionTransfer.
  Variables A B : Type.
  Variable encode : A -> B.
  Variable decode : B -> A.
  Hypothesis decode_encode : forall x, decode (encode x) = x.

  Inductive elem_rel : A -> B -> Prop :=
  | elem_rel_intro : forall x, elem_rel x (encode x).

  Inductive list_rel : list A -> list B -> Prop :=
  | list_rel_nil : list_rel [] []
  | list_rel_cons :
      forall x y xs ys,
        elem_rel x y ->
        list_rel xs ys ->
        list_rel (x :: xs) (y :: ys).

  Lemma map_encode_transfer :
    forall xs, list_rel xs (map encode xs).
  Proof.
    induction xs as [|x xs IH].
    - constructor.
    - simpl. constructor.
      + constructor.
      + exact IH.
  Qed.

  Lemma decode_encode_list :
    forall xs, map decode (map encode xs) = xs.
  Proof.
    induction xs as [|x xs IH].
    - reflexivity.
    - simpl. rewrite decode_encode. rewrite IH. reflexivity.
  Qed.

  Lemma length_transfer :
    forall xs ys, list_rel xs ys -> length xs = length ys.
  Proof.
    intros xs ys H.
    induction H.
    - reflexivity.
    - simpl. rewrite IHlist_rel. reflexivity.
  Qed.
End ListRetractionTransfer.

From Coq Require Import Vectors.Vector.
From Coq Require Import Program.Equality.
Import VectorNotations.

(* Seed-family replay: vectors and tuple-like indexed data. *)

Section VectorTuple.
  Variable A : Type.
  Variable R : A -> A -> Prop.

  Inductive vec_rel : forall n, t A n -> t A n -> Prop :=
  | vec_rel_nil : vec_rel 0 [] []
  | vec_rel_cons :
      forall n x y xs ys,
        R x y ->
        vec_rel n xs ys ->
        vec_rel (S n) (x :: xs) (y :: ys).

  Lemma vec_rel_head :
    forall n x y (xs ys : t A n),
      vec_rel (S n) (x :: xs) (y :: ys) ->
      R x y.
  Proof.
    intros n x y xs ys H.
    dependent destruction H.
    assumption.
  Qed.

  Lemma vec_rel_pair :
    forall x1 x2 y1 y2,
      R x1 y1 ->
      R x2 y2 ->
      vec_rel 2 [x1; x2] [y1; y2].
  Proof.
    intros x1 x2 y1 y2 H1 H2.
    repeat constructor; assumption.
  Qed.
End VectorTuple.

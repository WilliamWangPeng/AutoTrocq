From Coq Require Import Vectors.Vector.
From Coq Require Import Program.Equality.
Import VectorNotations.

(* Minimal kernel-candidate witness for D3-VECTOR-006.
   The file checks indexed-family transfer obligations for vectors whose
   indices are related by definitional equality. *)

Section VectorTransfer.
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
    forall n (x y : A) (xs ys : t A n),
      vec_rel (S n) (x :: xs) (y :: ys) ->
      R x y.
  Proof.
    intros n x y xs ys H.
    dependent destruction H.
    assumption.
  Qed.

  Lemma vec_rel_tail :
    forall n (x y : A) (xs ys : t A n),
      vec_rel (S n) (x :: xs) (y :: ys) ->
      vec_rel n xs ys.
  Proof.
    intros n x y xs ys H.
    dependent destruction H.
    assumption.
  Qed.
End VectorTransfer.

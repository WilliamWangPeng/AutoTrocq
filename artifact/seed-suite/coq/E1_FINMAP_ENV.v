From Coq Require Import Bool.Bool.
From Coq Require Import Lists.List.
Import ListNotations.

(* Seed-family replay: finite maps/environments as association lists. *)

Section FiniteMapEnvironment.
  Variables K V V' : Type.
  Variable key_eqb : K -> K -> bool.
  Variable val_rel : V -> V' -> Prop.

  Fixpoint lookup {A : Type} (k : K) (env : list (K * A)) : option A :=
    match env with
    | [] => None
    | (k', v) :: rest =>
        if key_eqb k k' then Some v else lookup k rest
    end.

  Inductive env_rel : list (K * V) -> list (K * V') -> Prop :=
  | env_rel_nil : env_rel [] []
  | env_rel_cons :
      forall k v v' xs ys,
        val_rel v v' ->
        env_rel xs ys ->
        env_rel ((k, v) :: xs) ((k, v') :: ys).

  Lemma lookup_related_hit :
    forall k v v' xs ys,
      key_eqb k k = true ->
      val_rel v v' ->
      env_rel xs ys ->
      exists a b,
        lookup k ((k, v) :: xs) = Some a /\
        lookup k ((k, v') :: ys) = Some b /\
        val_rel a b.
  Proof.
    intros k v v' xs ys Hkey Hv Henv.
    simpl.
    rewrite Hkey.
    exists v, v'.
    repeat split; exact Hv.
  Qed.

  Lemma env_rel_length :
    forall xs ys, env_rel xs ys -> length xs = length ys.
  Proof.
    intros xs ys H.
    induction H; simpl; congruence.
  Qed.
End FiniteMapEnvironment.

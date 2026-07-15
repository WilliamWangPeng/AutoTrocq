Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_066.
Record v70_point_66 := {
  v70_x_66 : nat;
  v70_y_66 : nat
}.

Definition v70_to_pair_66 (p : v70_point_66) : nat * nat :=
  (v70_x_66 p, v70_y_66 p).

Definition v70_from_pair_66 (p : nat * nat) : v70_point_66 :=
  {| v70_x_66 := fst p; v70_y_66 := snd p |}.

Theorem v70_pair_roundtrip_66 : forall p : nat * nat,
  v70_to_pair_66 (v70_from_pair_66 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_66 : forall p : v70_point_66,
  fst (v70_to_pair_66 p) = v70_x_66 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_066.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_045.
Record v70_point_45 := {
  v70_x_45 : nat;
  v70_y_45 : nat
}.

Definition v70_to_pair_45 (p : v70_point_45) : nat * nat :=
  (v70_x_45 p, v70_y_45 p).

Definition v70_from_pair_45 (p : nat * nat) : v70_point_45 :=
  {| v70_x_45 := fst p; v70_y_45 := snd p |}.

Theorem v70_pair_roundtrip_45 : forall p : nat * nat,
  v70_to_pair_45 (v70_from_pair_45 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_45 : forall p : v70_point_45,
  fst (v70_to_pair_45 p) = v70_x_45 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_045.


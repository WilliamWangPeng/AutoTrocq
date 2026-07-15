Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_050.
Record v70_point_50 := {
  v70_x_50 : nat;
  v70_y_50 : nat
}.

Definition v70_to_pair_50 (p : v70_point_50) : nat * nat :=
  (v70_x_50 p, v70_y_50 p).

Definition v70_from_pair_50 (p : nat * nat) : v70_point_50 :=
  {| v70_x_50 := fst p; v70_y_50 := snd p |}.

Theorem v70_pair_roundtrip_50 : forall p : nat * nat,
  v70_to_pair_50 (v70_from_pair_50 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_50 : forall p : v70_point_50,
  fst (v70_to_pair_50 p) = v70_x_50 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_050.


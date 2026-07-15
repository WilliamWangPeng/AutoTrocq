Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_064.
Record v70_point_64 := {
  v70_x_64 : nat;
  v70_y_64 : nat
}.

Definition v70_to_pair_64 (p : v70_point_64) : nat * nat :=
  (v70_x_64 p, v70_y_64 p).

Definition v70_from_pair_64 (p : nat * nat) : v70_point_64 :=
  {| v70_x_64 := fst p; v70_y_64 := snd p |}.

Theorem v70_pair_roundtrip_64 : forall p : nat * nat,
  v70_to_pair_64 (v70_from_pair_64 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_64 : forall p : v70_point_64,
  fst (v70_to_pair_64 p) = v70_x_64 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_064.


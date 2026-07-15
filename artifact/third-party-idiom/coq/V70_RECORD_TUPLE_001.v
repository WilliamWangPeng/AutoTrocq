Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_001.
Record v70_point_1 := {
  v70_x_1 : nat;
  v70_y_1 : nat
}.

Definition v70_to_pair_1 (p : v70_point_1) : nat * nat :=
  (v70_x_1 p, v70_y_1 p).

Definition v70_from_pair_1 (p : nat * nat) : v70_point_1 :=
  {| v70_x_1 := fst p; v70_y_1 := snd p |}.

Theorem v70_pair_roundtrip_1 : forall p : nat * nat,
  v70_to_pair_1 (v70_from_pair_1 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_1 : forall p : v70_point_1,
  fst (v70_to_pair_1 p) = v70_x_1 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_001.


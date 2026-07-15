Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_020.
Record v70_point_20 := {
  v70_x_20 : nat;
  v70_y_20 : nat
}.

Definition v70_to_pair_20 (p : v70_point_20) : nat * nat :=
  (v70_x_20 p, v70_y_20 p).

Definition v70_from_pair_20 (p : nat * nat) : v70_point_20 :=
  {| v70_x_20 := fst p; v70_y_20 := snd p |}.

Theorem v70_pair_roundtrip_20 : forall p : nat * nat,
  v70_to_pair_20 (v70_from_pair_20 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_20 : forall p : v70_point_20,
  fst (v70_to_pair_20 p) = v70_x_20 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_020.


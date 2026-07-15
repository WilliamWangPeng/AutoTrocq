Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_014.
Record v70_point_14 := {
  v70_x_14 : nat;
  v70_y_14 : nat
}.

Definition v70_to_pair_14 (p : v70_point_14) : nat * nat :=
  (v70_x_14 p, v70_y_14 p).

Definition v70_from_pair_14 (p : nat * nat) : v70_point_14 :=
  {| v70_x_14 := fst p; v70_y_14 := snd p |}.

Theorem v70_pair_roundtrip_14 : forall p : nat * nat,
  v70_to_pair_14 (v70_from_pair_14 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_14 : forall p : v70_point_14,
  fst (v70_to_pair_14 p) = v70_x_14 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_014.


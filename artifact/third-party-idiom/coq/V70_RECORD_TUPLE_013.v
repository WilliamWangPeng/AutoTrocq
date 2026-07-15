Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_013.
Record v70_point_13 := {
  v70_x_13 : nat;
  v70_y_13 : nat
}.

Definition v70_to_pair_13 (p : v70_point_13) : nat * nat :=
  (v70_x_13 p, v70_y_13 p).

Definition v70_from_pair_13 (p : nat * nat) : v70_point_13 :=
  {| v70_x_13 := fst p; v70_y_13 := snd p |}.

Theorem v70_pair_roundtrip_13 : forall p : nat * nat,
  v70_to_pair_13 (v70_from_pair_13 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_13 : forall p : v70_point_13,
  fst (v70_to_pair_13 p) = v70_x_13 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_013.


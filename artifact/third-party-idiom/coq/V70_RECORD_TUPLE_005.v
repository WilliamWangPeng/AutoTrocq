Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_005.
Record v70_point_5 := {
  v70_x_5 : nat;
  v70_y_5 : nat
}.

Definition v70_to_pair_5 (p : v70_point_5) : nat * nat :=
  (v70_x_5 p, v70_y_5 p).

Definition v70_from_pair_5 (p : nat * nat) : v70_point_5 :=
  {| v70_x_5 := fst p; v70_y_5 := snd p |}.

Theorem v70_pair_roundtrip_5 : forall p : nat * nat,
  v70_to_pair_5 (v70_from_pair_5 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_5 : forall p : v70_point_5,
  fst (v70_to_pair_5 p) = v70_x_5 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_005.


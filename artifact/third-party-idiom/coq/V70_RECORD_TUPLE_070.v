Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_070.
Record v70_point_70 := {
  v70_x_70 : nat;
  v70_y_70 : nat
}.

Definition v70_to_pair_70 (p : v70_point_70) : nat * nat :=
  (v70_x_70 p, v70_y_70 p).

Definition v70_from_pair_70 (p : nat * nat) : v70_point_70 :=
  {| v70_x_70 := fst p; v70_y_70 := snd p |}.

Theorem v70_pair_roundtrip_70 : forall p : nat * nat,
  v70_to_pair_70 (v70_from_pair_70 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_70 : forall p : v70_point_70,
  fst (v70_to_pair_70 p) = v70_x_70 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_070.


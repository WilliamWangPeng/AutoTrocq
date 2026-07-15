Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_078.
Record v70_point_78 := {
  v70_x_78 : nat;
  v70_y_78 : nat
}.

Definition v70_to_pair_78 (p : v70_point_78) : nat * nat :=
  (v70_x_78 p, v70_y_78 p).

Definition v70_from_pair_78 (p : nat * nat) : v70_point_78 :=
  {| v70_x_78 := fst p; v70_y_78 := snd p |}.

Theorem v70_pair_roundtrip_78 : forall p : nat * nat,
  v70_to_pair_78 (v70_from_pair_78 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_78 : forall p : v70_point_78,
  fst (v70_to_pair_78 p) = v70_x_78 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_078.


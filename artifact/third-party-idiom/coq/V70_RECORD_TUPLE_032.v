Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_032.
Record v70_point_32 := {
  v70_x_32 : nat;
  v70_y_32 : nat
}.

Definition v70_to_pair_32 (p : v70_point_32) : nat * nat :=
  (v70_x_32 p, v70_y_32 p).

Definition v70_from_pair_32 (p : nat * nat) : v70_point_32 :=
  {| v70_x_32 := fst p; v70_y_32 := snd p |}.

Theorem v70_pair_roundtrip_32 : forall p : nat * nat,
  v70_to_pair_32 (v70_from_pair_32 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_32 : forall p : v70_point_32,
  fst (v70_to_pair_32 p) = v70_x_32 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_032.


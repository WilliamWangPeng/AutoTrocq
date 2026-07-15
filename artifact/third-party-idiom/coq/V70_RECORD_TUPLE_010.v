Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_010.
Record v70_point_10 := {
  v70_x_10 : nat;
  v70_y_10 : nat
}.

Definition v70_to_pair_10 (p : v70_point_10) : nat * nat :=
  (v70_x_10 p, v70_y_10 p).

Definition v70_from_pair_10 (p : nat * nat) : v70_point_10 :=
  {| v70_x_10 := fst p; v70_y_10 := snd p |}.

Theorem v70_pair_roundtrip_10 : forall p : nat * nat,
  v70_to_pair_10 (v70_from_pair_10 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_10 : forall p : v70_point_10,
  fst (v70_to_pair_10 p) = v70_x_10 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_010.


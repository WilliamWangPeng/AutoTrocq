Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_079.
Record v70_point_79 := {
  v70_x_79 : nat;
  v70_y_79 : nat
}.

Definition v70_to_pair_79 (p : v70_point_79) : nat * nat :=
  (v70_x_79 p, v70_y_79 p).

Definition v70_from_pair_79 (p : nat * nat) : v70_point_79 :=
  {| v70_x_79 := fst p; v70_y_79 := snd p |}.

Theorem v70_pair_roundtrip_79 : forall p : nat * nat,
  v70_to_pair_79 (v70_from_pair_79 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_79 : forall p : v70_point_79,
  fst (v70_to_pair_79 p) = v70_x_79 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_079.


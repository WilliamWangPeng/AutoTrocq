Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_060.
Record v70_point_60 := {
  v70_x_60 : nat;
  v70_y_60 : nat
}.

Definition v70_to_pair_60 (p : v70_point_60) : nat * nat :=
  (v70_x_60 p, v70_y_60 p).

Definition v70_from_pair_60 (p : nat * nat) : v70_point_60 :=
  {| v70_x_60 := fst p; v70_y_60 := snd p |}.

Theorem v70_pair_roundtrip_60 : forall p : nat * nat,
  v70_to_pair_60 (v70_from_pair_60 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_60 : forall p : v70_point_60,
  fst (v70_to_pair_60 p) = v70_x_60 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_060.


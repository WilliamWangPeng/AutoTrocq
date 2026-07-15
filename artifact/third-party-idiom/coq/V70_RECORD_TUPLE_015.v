Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_015.
Record v70_point_15 := {
  v70_x_15 : nat;
  v70_y_15 : nat
}.

Definition v70_to_pair_15 (p : v70_point_15) : nat * nat :=
  (v70_x_15 p, v70_y_15 p).

Definition v70_from_pair_15 (p : nat * nat) : v70_point_15 :=
  {| v70_x_15 := fst p; v70_y_15 := snd p |}.

Theorem v70_pair_roundtrip_15 : forall p : nat * nat,
  v70_to_pair_15 (v70_from_pair_15 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_15 : forall p : v70_point_15,
  fst (v70_to_pair_15 p) = v70_x_15 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_015.


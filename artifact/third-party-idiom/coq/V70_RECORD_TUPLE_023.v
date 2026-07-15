Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_023.
Record v70_point_23 := {
  v70_x_23 : nat;
  v70_y_23 : nat
}.

Definition v70_to_pair_23 (p : v70_point_23) : nat * nat :=
  (v70_x_23 p, v70_y_23 p).

Definition v70_from_pair_23 (p : nat * nat) : v70_point_23 :=
  {| v70_x_23 := fst p; v70_y_23 := snd p |}.

Theorem v70_pair_roundtrip_23 : forall p : nat * nat,
  v70_to_pair_23 (v70_from_pair_23 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_23 : forall p : v70_point_23,
  fst (v70_to_pair_23 p) = v70_x_23 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_023.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_021.
Record v70_point_21 := {
  v70_x_21 : nat;
  v70_y_21 : nat
}.

Definition v70_to_pair_21 (p : v70_point_21) : nat * nat :=
  (v70_x_21 p, v70_y_21 p).

Definition v70_from_pair_21 (p : nat * nat) : v70_point_21 :=
  {| v70_x_21 := fst p; v70_y_21 := snd p |}.

Theorem v70_pair_roundtrip_21 : forall p : nat * nat,
  v70_to_pair_21 (v70_from_pair_21 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_21 : forall p : v70_point_21,
  fst (v70_to_pair_21 p) = v70_x_21 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_021.


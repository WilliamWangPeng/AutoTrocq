Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_075.
Record v70_point_75 := {
  v70_x_75 : nat;
  v70_y_75 : nat
}.

Definition v70_to_pair_75 (p : v70_point_75) : nat * nat :=
  (v70_x_75 p, v70_y_75 p).

Definition v70_from_pair_75 (p : nat * nat) : v70_point_75 :=
  {| v70_x_75 := fst p; v70_y_75 := snd p |}.

Theorem v70_pair_roundtrip_75 : forall p : nat * nat,
  v70_to_pair_75 (v70_from_pair_75 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_75 : forall p : v70_point_75,
  fst (v70_to_pair_75 p) = v70_x_75 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_075.


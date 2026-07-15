Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_061.
Record v70_point_61 := {
  v70_x_61 : nat;
  v70_y_61 : nat
}.

Definition v70_to_pair_61 (p : v70_point_61) : nat * nat :=
  (v70_x_61 p, v70_y_61 p).

Definition v70_from_pair_61 (p : nat * nat) : v70_point_61 :=
  {| v70_x_61 := fst p; v70_y_61 := snd p |}.

Theorem v70_pair_roundtrip_61 : forall p : nat * nat,
  v70_to_pair_61 (v70_from_pair_61 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_61 : forall p : v70_point_61,
  fst (v70_to_pair_61 p) = v70_x_61 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_061.


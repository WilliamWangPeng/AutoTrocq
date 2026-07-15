Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_031.
Record v70_point_31 := {
  v70_x_31 : nat;
  v70_y_31 : nat
}.

Definition v70_to_pair_31 (p : v70_point_31) : nat * nat :=
  (v70_x_31 p, v70_y_31 p).

Definition v70_from_pair_31 (p : nat * nat) : v70_point_31 :=
  {| v70_x_31 := fst p; v70_y_31 := snd p |}.

Theorem v70_pair_roundtrip_31 : forall p : nat * nat,
  v70_to_pair_31 (v70_from_pair_31 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_31 : forall p : v70_point_31,
  fst (v70_to_pair_31 p) = v70_x_31 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_031.


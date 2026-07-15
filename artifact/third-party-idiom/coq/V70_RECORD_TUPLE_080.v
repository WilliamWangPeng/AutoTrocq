Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_080.
Record v70_point_80 := {
  v70_x_80 : nat;
  v70_y_80 : nat
}.

Definition v70_to_pair_80 (p : v70_point_80) : nat * nat :=
  (v70_x_80 p, v70_y_80 p).

Definition v70_from_pair_80 (p : nat * nat) : v70_point_80 :=
  {| v70_x_80 := fst p; v70_y_80 := snd p |}.

Theorem v70_pair_roundtrip_80 : forall p : nat * nat,
  v70_to_pair_80 (v70_from_pair_80 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_80 : forall p : v70_point_80,
  fst (v70_to_pair_80 p) = v70_x_80 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_080.


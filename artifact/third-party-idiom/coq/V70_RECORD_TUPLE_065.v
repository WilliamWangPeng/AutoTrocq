Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_065.
Record v70_point_65 := {
  v70_x_65 : nat;
  v70_y_65 : nat
}.

Definition v70_to_pair_65 (p : v70_point_65) : nat * nat :=
  (v70_x_65 p, v70_y_65 p).

Definition v70_from_pair_65 (p : nat * nat) : v70_point_65 :=
  {| v70_x_65 := fst p; v70_y_65 := snd p |}.

Theorem v70_pair_roundtrip_65 : forall p : nat * nat,
  v70_to_pair_65 (v70_from_pair_65 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_65 : forall p : v70_point_65,
  fst (v70_to_pair_65 p) = v70_x_65 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_065.


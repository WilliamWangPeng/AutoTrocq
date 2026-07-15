Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_040.
Record v70_point_40 := {
  v70_x_40 : nat;
  v70_y_40 : nat
}.

Definition v70_to_pair_40 (p : v70_point_40) : nat * nat :=
  (v70_x_40 p, v70_y_40 p).

Definition v70_from_pair_40 (p : nat * nat) : v70_point_40 :=
  {| v70_x_40 := fst p; v70_y_40 := snd p |}.

Theorem v70_pair_roundtrip_40 : forall p : nat * nat,
  v70_to_pair_40 (v70_from_pair_40 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_40 : forall p : v70_point_40,
  fst (v70_to_pair_40 p) = v70_x_40 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_040.


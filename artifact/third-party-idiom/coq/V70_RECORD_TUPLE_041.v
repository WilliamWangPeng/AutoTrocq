Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_041.
Record v70_point_41 := {
  v70_x_41 : nat;
  v70_y_41 : nat
}.

Definition v70_to_pair_41 (p : v70_point_41) : nat * nat :=
  (v70_x_41 p, v70_y_41 p).

Definition v70_from_pair_41 (p : nat * nat) : v70_point_41 :=
  {| v70_x_41 := fst p; v70_y_41 := snd p |}.

Theorem v70_pair_roundtrip_41 : forall p : nat * nat,
  v70_to_pair_41 (v70_from_pair_41 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_41 : forall p : v70_point_41,
  fst (v70_to_pair_41 p) = v70_x_41 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_041.


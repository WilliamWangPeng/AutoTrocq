Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_035.
Record v70_point_35 := {
  v70_x_35 : nat;
  v70_y_35 : nat
}.

Definition v70_to_pair_35 (p : v70_point_35) : nat * nat :=
  (v70_x_35 p, v70_y_35 p).

Definition v70_from_pair_35 (p : nat * nat) : v70_point_35 :=
  {| v70_x_35 := fst p; v70_y_35 := snd p |}.

Theorem v70_pair_roundtrip_35 : forall p : nat * nat,
  v70_to_pair_35 (v70_from_pair_35 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_35 : forall p : v70_point_35,
  fst (v70_to_pair_35 p) = v70_x_35 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_035.


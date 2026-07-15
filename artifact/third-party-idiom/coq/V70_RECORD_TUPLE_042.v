Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_042.
Record v70_point_42 := {
  v70_x_42 : nat;
  v70_y_42 : nat
}.

Definition v70_to_pair_42 (p : v70_point_42) : nat * nat :=
  (v70_x_42 p, v70_y_42 p).

Definition v70_from_pair_42 (p : nat * nat) : v70_point_42 :=
  {| v70_x_42 := fst p; v70_y_42 := snd p |}.

Theorem v70_pair_roundtrip_42 : forall p : nat * nat,
  v70_to_pair_42 (v70_from_pair_42 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_42 : forall p : v70_point_42,
  fst (v70_to_pair_42 p) = v70_x_42 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_042.


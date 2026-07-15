Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_036.
Record v70_point_36 := {
  v70_x_36 : nat;
  v70_y_36 : nat
}.

Definition v70_to_pair_36 (p : v70_point_36) : nat * nat :=
  (v70_x_36 p, v70_y_36 p).

Definition v70_from_pair_36 (p : nat * nat) : v70_point_36 :=
  {| v70_x_36 := fst p; v70_y_36 := snd p |}.

Theorem v70_pair_roundtrip_36 : forall p : nat * nat,
  v70_to_pair_36 (v70_from_pair_36 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_36 : forall p : v70_point_36,
  fst (v70_to_pair_36 p) = v70_x_36 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_036.


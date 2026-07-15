Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_002.
Record v70_point_2 := {
  v70_x_2 : nat;
  v70_y_2 : nat
}.

Definition v70_to_pair_2 (p : v70_point_2) : nat * nat :=
  (v70_x_2 p, v70_y_2 p).

Definition v70_from_pair_2 (p : nat * nat) : v70_point_2 :=
  {| v70_x_2 := fst p; v70_y_2 := snd p |}.

Theorem v70_pair_roundtrip_2 : forall p : nat * nat,
  v70_to_pair_2 (v70_from_pair_2 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_2 : forall p : v70_point_2,
  fst (v70_to_pair_2 p) = v70_x_2 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_002.


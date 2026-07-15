Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_011.
Record v70_point_11 := {
  v70_x_11 : nat;
  v70_y_11 : nat
}.

Definition v70_to_pair_11 (p : v70_point_11) : nat * nat :=
  (v70_x_11 p, v70_y_11 p).

Definition v70_from_pair_11 (p : nat * nat) : v70_point_11 :=
  {| v70_x_11 := fst p; v70_y_11 := snd p |}.

Theorem v70_pair_roundtrip_11 : forall p : nat * nat,
  v70_to_pair_11 (v70_from_pair_11 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_11 : forall p : v70_point_11,
  fst (v70_to_pair_11 p) = v70_x_11 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_011.


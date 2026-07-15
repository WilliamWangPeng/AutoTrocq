Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_016.
Record v70_point_16 := {
  v70_x_16 : nat;
  v70_y_16 : nat
}.

Definition v70_to_pair_16 (p : v70_point_16) : nat * nat :=
  (v70_x_16 p, v70_y_16 p).

Definition v70_from_pair_16 (p : nat * nat) : v70_point_16 :=
  {| v70_x_16 := fst p; v70_y_16 := snd p |}.

Theorem v70_pair_roundtrip_16 : forall p : nat * nat,
  v70_to_pair_16 (v70_from_pair_16 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_16 : forall p : v70_point_16,
  fst (v70_to_pair_16 p) = v70_x_16 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_016.


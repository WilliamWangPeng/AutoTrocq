Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_018.
Record v70_point_18 := {
  v70_x_18 : nat;
  v70_y_18 : nat
}.

Definition v70_to_pair_18 (p : v70_point_18) : nat * nat :=
  (v70_x_18 p, v70_y_18 p).

Definition v70_from_pair_18 (p : nat * nat) : v70_point_18 :=
  {| v70_x_18 := fst p; v70_y_18 := snd p |}.

Theorem v70_pair_roundtrip_18 : forall p : nat * nat,
  v70_to_pair_18 (v70_from_pair_18 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_18 : forall p : v70_point_18,
  fst (v70_to_pair_18 p) = v70_x_18 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_018.


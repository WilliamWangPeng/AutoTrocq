Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_008.
Record v70_point_8 := {
  v70_x_8 : nat;
  v70_y_8 : nat
}.

Definition v70_to_pair_8 (p : v70_point_8) : nat * nat :=
  (v70_x_8 p, v70_y_8 p).

Definition v70_from_pair_8 (p : nat * nat) : v70_point_8 :=
  {| v70_x_8 := fst p; v70_y_8 := snd p |}.

Theorem v70_pair_roundtrip_8 : forall p : nat * nat,
  v70_to_pair_8 (v70_from_pair_8 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_8 : forall p : v70_point_8,
  fst (v70_to_pair_8 p) = v70_x_8 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_008.


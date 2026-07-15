Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_028.
Record v70_point_28 := {
  v70_x_28 : nat;
  v70_y_28 : nat
}.

Definition v70_to_pair_28 (p : v70_point_28) : nat * nat :=
  (v70_x_28 p, v70_y_28 p).

Definition v70_from_pair_28 (p : nat * nat) : v70_point_28 :=
  {| v70_x_28 := fst p; v70_y_28 := snd p |}.

Theorem v70_pair_roundtrip_28 : forall p : nat * nat,
  v70_to_pair_28 (v70_from_pair_28 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_28 : forall p : v70_point_28,
  fst (v70_to_pair_28 p) = v70_x_28 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_028.


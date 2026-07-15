Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_022.
Record v70_point_22 := {
  v70_x_22 : nat;
  v70_y_22 : nat
}.

Definition v70_to_pair_22 (p : v70_point_22) : nat * nat :=
  (v70_x_22 p, v70_y_22 p).

Definition v70_from_pair_22 (p : nat * nat) : v70_point_22 :=
  {| v70_x_22 := fst p; v70_y_22 := snd p |}.

Theorem v70_pair_roundtrip_22 : forall p : nat * nat,
  v70_to_pair_22 (v70_from_pair_22 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_22 : forall p : v70_point_22,
  fst (v70_to_pair_22 p) = v70_x_22 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_022.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_009.
Record v70_point_9 := {
  v70_x_9 : nat;
  v70_y_9 : nat
}.

Definition v70_to_pair_9 (p : v70_point_9) : nat * nat :=
  (v70_x_9 p, v70_y_9 p).

Definition v70_from_pair_9 (p : nat * nat) : v70_point_9 :=
  {| v70_x_9 := fst p; v70_y_9 := snd p |}.

Theorem v70_pair_roundtrip_9 : forall p : nat * nat,
  v70_to_pair_9 (v70_from_pair_9 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_9 : forall p : v70_point_9,
  fst (v70_to_pair_9 p) = v70_x_9 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_009.


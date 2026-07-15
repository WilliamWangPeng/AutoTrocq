Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_056.
Record v70_point_56 := {
  v70_x_56 : nat;
  v70_y_56 : nat
}.

Definition v70_to_pair_56 (p : v70_point_56) : nat * nat :=
  (v70_x_56 p, v70_y_56 p).

Definition v70_from_pair_56 (p : nat * nat) : v70_point_56 :=
  {| v70_x_56 := fst p; v70_y_56 := snd p |}.

Theorem v70_pair_roundtrip_56 : forall p : nat * nat,
  v70_to_pair_56 (v70_from_pair_56 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_56 : forall p : v70_point_56,
  fst (v70_to_pair_56 p) = v70_x_56 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_056.


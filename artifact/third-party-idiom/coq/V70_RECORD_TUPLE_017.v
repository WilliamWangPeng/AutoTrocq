Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_017.
Record v70_point_17 := {
  v70_x_17 : nat;
  v70_y_17 : nat
}.

Definition v70_to_pair_17 (p : v70_point_17) : nat * nat :=
  (v70_x_17 p, v70_y_17 p).

Definition v70_from_pair_17 (p : nat * nat) : v70_point_17 :=
  {| v70_x_17 := fst p; v70_y_17 := snd p |}.

Theorem v70_pair_roundtrip_17 : forall p : nat * nat,
  v70_to_pair_17 (v70_from_pair_17 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_17 : forall p : v70_point_17,
  fst (v70_to_pair_17 p) = v70_x_17 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_017.


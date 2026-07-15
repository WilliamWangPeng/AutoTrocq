Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_025.
Record v70_point_25 := {
  v70_x_25 : nat;
  v70_y_25 : nat
}.

Definition v70_to_pair_25 (p : v70_point_25) : nat * nat :=
  (v70_x_25 p, v70_y_25 p).

Definition v70_from_pair_25 (p : nat * nat) : v70_point_25 :=
  {| v70_x_25 := fst p; v70_y_25 := snd p |}.

Theorem v70_pair_roundtrip_25 : forall p : nat * nat,
  v70_to_pair_25 (v70_from_pair_25 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_25 : forall p : v70_point_25,
  fst (v70_to_pair_25 p) = v70_x_25 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_025.


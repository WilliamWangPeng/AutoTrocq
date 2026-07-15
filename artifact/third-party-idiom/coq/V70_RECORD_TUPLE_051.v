Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_051.
Record v70_point_51 := {
  v70_x_51 : nat;
  v70_y_51 : nat
}.

Definition v70_to_pair_51 (p : v70_point_51) : nat * nat :=
  (v70_x_51 p, v70_y_51 p).

Definition v70_from_pair_51 (p : nat * nat) : v70_point_51 :=
  {| v70_x_51 := fst p; v70_y_51 := snd p |}.

Theorem v70_pair_roundtrip_51 : forall p : nat * nat,
  v70_to_pair_51 (v70_from_pair_51 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_51 : forall p : v70_point_51,
  fst (v70_to_pair_51 p) = v70_x_51 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_051.


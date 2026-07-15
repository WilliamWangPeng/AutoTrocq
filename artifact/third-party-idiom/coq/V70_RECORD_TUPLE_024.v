Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_024.
Record v70_point_24 := {
  v70_x_24 : nat;
  v70_y_24 : nat
}.

Definition v70_to_pair_24 (p : v70_point_24) : nat * nat :=
  (v70_x_24 p, v70_y_24 p).

Definition v70_from_pair_24 (p : nat * nat) : v70_point_24 :=
  {| v70_x_24 := fst p; v70_y_24 := snd p |}.

Theorem v70_pair_roundtrip_24 : forall p : nat * nat,
  v70_to_pair_24 (v70_from_pair_24 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_24 : forall p : v70_point_24,
  fst (v70_to_pair_24 p) = v70_x_24 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_024.


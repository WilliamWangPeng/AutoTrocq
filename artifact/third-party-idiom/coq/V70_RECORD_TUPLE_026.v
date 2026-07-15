Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_026.
Record v70_point_26 := {
  v70_x_26 : nat;
  v70_y_26 : nat
}.

Definition v70_to_pair_26 (p : v70_point_26) : nat * nat :=
  (v70_x_26 p, v70_y_26 p).

Definition v70_from_pair_26 (p : nat * nat) : v70_point_26 :=
  {| v70_x_26 := fst p; v70_y_26 := snd p |}.

Theorem v70_pair_roundtrip_26 : forall p : nat * nat,
  v70_to_pair_26 (v70_from_pair_26 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_26 : forall p : v70_point_26,
  fst (v70_to_pair_26 p) = v70_x_26 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_026.


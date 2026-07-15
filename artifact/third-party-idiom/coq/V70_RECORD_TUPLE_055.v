Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_055.
Record v70_point_55 := {
  v70_x_55 : nat;
  v70_y_55 : nat
}.

Definition v70_to_pair_55 (p : v70_point_55) : nat * nat :=
  (v70_x_55 p, v70_y_55 p).

Definition v70_from_pair_55 (p : nat * nat) : v70_point_55 :=
  {| v70_x_55 := fst p; v70_y_55 := snd p |}.

Theorem v70_pair_roundtrip_55 : forall p : nat * nat,
  v70_to_pair_55 (v70_from_pair_55 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_55 : forall p : v70_point_55,
  fst (v70_to_pair_55 p) = v70_x_55 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_055.


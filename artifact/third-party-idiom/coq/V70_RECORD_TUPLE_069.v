Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_069.
Record v70_point_69 := {
  v70_x_69 : nat;
  v70_y_69 : nat
}.

Definition v70_to_pair_69 (p : v70_point_69) : nat * nat :=
  (v70_x_69 p, v70_y_69 p).

Definition v70_from_pair_69 (p : nat * nat) : v70_point_69 :=
  {| v70_x_69 := fst p; v70_y_69 := snd p |}.

Theorem v70_pair_roundtrip_69 : forall p : nat * nat,
  v70_to_pair_69 (v70_from_pair_69 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_69 : forall p : v70_point_69,
  fst (v70_to_pair_69 p) = v70_x_69 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_069.


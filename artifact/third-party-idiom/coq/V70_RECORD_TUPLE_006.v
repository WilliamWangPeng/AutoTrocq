Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_006.
Record v70_point_6 := {
  v70_x_6 : nat;
  v70_y_6 : nat
}.

Definition v70_to_pair_6 (p : v70_point_6) : nat * nat :=
  (v70_x_6 p, v70_y_6 p).

Definition v70_from_pair_6 (p : nat * nat) : v70_point_6 :=
  {| v70_x_6 := fst p; v70_y_6 := snd p |}.

Theorem v70_pair_roundtrip_6 : forall p : nat * nat,
  v70_to_pair_6 (v70_from_pair_6 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_6 : forall p : v70_point_6,
  fst (v70_to_pair_6 p) = v70_x_6 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_006.


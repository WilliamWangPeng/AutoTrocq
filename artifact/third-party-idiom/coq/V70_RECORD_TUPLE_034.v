Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_034.
Record v70_point_34 := {
  v70_x_34 : nat;
  v70_y_34 : nat
}.

Definition v70_to_pair_34 (p : v70_point_34) : nat * nat :=
  (v70_x_34 p, v70_y_34 p).

Definition v70_from_pair_34 (p : nat * nat) : v70_point_34 :=
  {| v70_x_34 := fst p; v70_y_34 := snd p |}.

Theorem v70_pair_roundtrip_34 : forall p : nat * nat,
  v70_to_pair_34 (v70_from_pair_34 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_34 : forall p : v70_point_34,
  fst (v70_to_pair_34 p) = v70_x_34 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_034.


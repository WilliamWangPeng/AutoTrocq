Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_063.
Record v70_point_63 := {
  v70_x_63 : nat;
  v70_y_63 : nat
}.

Definition v70_to_pair_63 (p : v70_point_63) : nat * nat :=
  (v70_x_63 p, v70_y_63 p).

Definition v70_from_pair_63 (p : nat * nat) : v70_point_63 :=
  {| v70_x_63 := fst p; v70_y_63 := snd p |}.

Theorem v70_pair_roundtrip_63 : forall p : nat * nat,
  v70_to_pair_63 (v70_from_pair_63 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_63 : forall p : v70_point_63,
  fst (v70_to_pair_63 p) = v70_x_63 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_063.


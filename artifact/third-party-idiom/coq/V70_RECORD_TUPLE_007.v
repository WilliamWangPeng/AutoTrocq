Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_007.
Record v70_point_7 := {
  v70_x_7 : nat;
  v70_y_7 : nat
}.

Definition v70_to_pair_7 (p : v70_point_7) : nat * nat :=
  (v70_x_7 p, v70_y_7 p).

Definition v70_from_pair_7 (p : nat * nat) : v70_point_7 :=
  {| v70_x_7 := fst p; v70_y_7 := snd p |}.

Theorem v70_pair_roundtrip_7 : forall p : nat * nat,
  v70_to_pair_7 (v70_from_pair_7 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_7 : forall p : v70_point_7,
  fst (v70_to_pair_7 p) = v70_x_7 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_007.


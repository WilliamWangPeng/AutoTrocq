Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_058.
Record v70_point_58 := {
  v70_x_58 : nat;
  v70_y_58 : nat
}.

Definition v70_to_pair_58 (p : v70_point_58) : nat * nat :=
  (v70_x_58 p, v70_y_58 p).

Definition v70_from_pair_58 (p : nat * nat) : v70_point_58 :=
  {| v70_x_58 := fst p; v70_y_58 := snd p |}.

Theorem v70_pair_roundtrip_58 : forall p : nat * nat,
  v70_to_pair_58 (v70_from_pair_58 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_58 : forall p : v70_point_58,
  fst (v70_to_pair_58 p) = v70_x_58 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_058.


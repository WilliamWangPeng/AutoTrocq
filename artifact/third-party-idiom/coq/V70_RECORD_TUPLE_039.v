Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_039.
Record v70_point_39 := {
  v70_x_39 : nat;
  v70_y_39 : nat
}.

Definition v70_to_pair_39 (p : v70_point_39) : nat * nat :=
  (v70_x_39 p, v70_y_39 p).

Definition v70_from_pair_39 (p : nat * nat) : v70_point_39 :=
  {| v70_x_39 := fst p; v70_y_39 := snd p |}.

Theorem v70_pair_roundtrip_39 : forall p : nat * nat,
  v70_to_pair_39 (v70_from_pair_39 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_39 : forall p : v70_point_39,
  fst (v70_to_pair_39 p) = v70_x_39 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_039.


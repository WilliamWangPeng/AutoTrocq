Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_048.
Record v70_point_48 := {
  v70_x_48 : nat;
  v70_y_48 : nat
}.

Definition v70_to_pair_48 (p : v70_point_48) : nat * nat :=
  (v70_x_48 p, v70_y_48 p).

Definition v70_from_pair_48 (p : nat * nat) : v70_point_48 :=
  {| v70_x_48 := fst p; v70_y_48 := snd p |}.

Theorem v70_pair_roundtrip_48 : forall p : nat * nat,
  v70_to_pair_48 (v70_from_pair_48 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_48 : forall p : v70_point_48,
  fst (v70_to_pair_48 p) = v70_x_48 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_048.


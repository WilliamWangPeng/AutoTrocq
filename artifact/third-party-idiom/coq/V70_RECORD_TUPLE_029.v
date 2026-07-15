Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_029.
Record v70_point_29 := {
  v70_x_29 : nat;
  v70_y_29 : nat
}.

Definition v70_to_pair_29 (p : v70_point_29) : nat * nat :=
  (v70_x_29 p, v70_y_29 p).

Definition v70_from_pair_29 (p : nat * nat) : v70_point_29 :=
  {| v70_x_29 := fst p; v70_y_29 := snd p |}.

Theorem v70_pair_roundtrip_29 : forall p : nat * nat,
  v70_to_pair_29 (v70_from_pair_29 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_29 : forall p : v70_point_29,
  fst (v70_to_pair_29 p) = v70_x_29 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_029.


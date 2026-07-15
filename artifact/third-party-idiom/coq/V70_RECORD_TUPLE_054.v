Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_054.
Record v70_point_54 := {
  v70_x_54 : nat;
  v70_y_54 : nat
}.

Definition v70_to_pair_54 (p : v70_point_54) : nat * nat :=
  (v70_x_54 p, v70_y_54 p).

Definition v70_from_pair_54 (p : nat * nat) : v70_point_54 :=
  {| v70_x_54 := fst p; v70_y_54 := snd p |}.

Theorem v70_pair_roundtrip_54 : forall p : nat * nat,
  v70_to_pair_54 (v70_from_pair_54 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_54 : forall p : v70_point_54,
  fst (v70_to_pair_54 p) = v70_x_54 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_054.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_072.
Record v70_point_72 := {
  v70_x_72 : nat;
  v70_y_72 : nat
}.

Definition v70_to_pair_72 (p : v70_point_72) : nat * nat :=
  (v70_x_72 p, v70_y_72 p).

Definition v70_from_pair_72 (p : nat * nat) : v70_point_72 :=
  {| v70_x_72 := fst p; v70_y_72 := snd p |}.

Theorem v70_pair_roundtrip_72 : forall p : nat * nat,
  v70_to_pair_72 (v70_from_pair_72 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_72 : forall p : v70_point_72,
  fst (v70_to_pair_72 p) = v70_x_72 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_072.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_033.
Record v70_point_33 := {
  v70_x_33 : nat;
  v70_y_33 : nat
}.

Definition v70_to_pair_33 (p : v70_point_33) : nat * nat :=
  (v70_x_33 p, v70_y_33 p).

Definition v70_from_pair_33 (p : nat * nat) : v70_point_33 :=
  {| v70_x_33 := fst p; v70_y_33 := snd p |}.

Theorem v70_pair_roundtrip_33 : forall p : nat * nat,
  v70_to_pair_33 (v70_from_pair_33 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_33 : forall p : v70_point_33,
  fst (v70_to_pair_33 p) = v70_x_33 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_033.


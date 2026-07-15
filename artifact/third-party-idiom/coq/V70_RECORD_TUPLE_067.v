Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_067.
Record v70_point_67 := {
  v70_x_67 : nat;
  v70_y_67 : nat
}.

Definition v70_to_pair_67 (p : v70_point_67) : nat * nat :=
  (v70_x_67 p, v70_y_67 p).

Definition v70_from_pair_67 (p : nat * nat) : v70_point_67 :=
  {| v70_x_67 := fst p; v70_y_67 := snd p |}.

Theorem v70_pair_roundtrip_67 : forall p : nat * nat,
  v70_to_pair_67 (v70_from_pair_67 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_67 : forall p : v70_point_67,
  fst (v70_to_pair_67 p) = v70_x_67 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_067.


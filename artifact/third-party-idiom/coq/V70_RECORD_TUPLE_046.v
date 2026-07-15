Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_046.
Record v70_point_46 := {
  v70_x_46 : nat;
  v70_y_46 : nat
}.

Definition v70_to_pair_46 (p : v70_point_46) : nat * nat :=
  (v70_x_46 p, v70_y_46 p).

Definition v70_from_pair_46 (p : nat * nat) : v70_point_46 :=
  {| v70_x_46 := fst p; v70_y_46 := snd p |}.

Theorem v70_pair_roundtrip_46 : forall p : nat * nat,
  v70_to_pair_46 (v70_from_pair_46 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_46 : forall p : v70_point_46,
  fst (v70_to_pair_46 p) = v70_x_46 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_046.


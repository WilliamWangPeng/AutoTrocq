Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_027.
Record v70_point_27 := {
  v70_x_27 : nat;
  v70_y_27 : nat
}.

Definition v70_to_pair_27 (p : v70_point_27) : nat * nat :=
  (v70_x_27 p, v70_y_27 p).

Definition v70_from_pair_27 (p : nat * nat) : v70_point_27 :=
  {| v70_x_27 := fst p; v70_y_27 := snd p |}.

Theorem v70_pair_roundtrip_27 : forall p : nat * nat,
  v70_to_pair_27 (v70_from_pair_27 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_27 : forall p : v70_point_27,
  fst (v70_to_pair_27 p) = v70_x_27 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_027.


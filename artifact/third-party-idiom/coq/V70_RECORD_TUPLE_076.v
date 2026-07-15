Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_076.
Record v70_point_76 := {
  v70_x_76 : nat;
  v70_y_76 : nat
}.

Definition v70_to_pair_76 (p : v70_point_76) : nat * nat :=
  (v70_x_76 p, v70_y_76 p).

Definition v70_from_pair_76 (p : nat * nat) : v70_point_76 :=
  {| v70_x_76 := fst p; v70_y_76 := snd p |}.

Theorem v70_pair_roundtrip_76 : forall p : nat * nat,
  v70_to_pair_76 (v70_from_pair_76 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_76 : forall p : v70_point_76,
  fst (v70_to_pair_76 p) = v70_x_76 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_076.


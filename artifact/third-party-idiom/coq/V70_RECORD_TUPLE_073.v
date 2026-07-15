Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_073.
Record v70_point_73 := {
  v70_x_73 : nat;
  v70_y_73 : nat
}.

Definition v70_to_pair_73 (p : v70_point_73) : nat * nat :=
  (v70_x_73 p, v70_y_73 p).

Definition v70_from_pair_73 (p : nat * nat) : v70_point_73 :=
  {| v70_x_73 := fst p; v70_y_73 := snd p |}.

Theorem v70_pair_roundtrip_73 : forall p : nat * nat,
  v70_to_pair_73 (v70_from_pair_73 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_73 : forall p : v70_point_73,
  fst (v70_to_pair_73 p) = v70_x_73 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_073.


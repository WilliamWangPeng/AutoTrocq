Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_071.
Record v70_point_71 := {
  v70_x_71 : nat;
  v70_y_71 : nat
}.

Definition v70_to_pair_71 (p : v70_point_71) : nat * nat :=
  (v70_x_71 p, v70_y_71 p).

Definition v70_from_pair_71 (p : nat * nat) : v70_point_71 :=
  {| v70_x_71 := fst p; v70_y_71 := snd p |}.

Theorem v70_pair_roundtrip_71 : forall p : nat * nat,
  v70_to_pair_71 (v70_from_pair_71 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_71 : forall p : v70_point_71,
  fst (v70_to_pair_71 p) = v70_x_71 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_071.


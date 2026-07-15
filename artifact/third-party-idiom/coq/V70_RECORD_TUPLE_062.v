Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_062.
Record v70_point_62 := {
  v70_x_62 : nat;
  v70_y_62 : nat
}.

Definition v70_to_pair_62 (p : v70_point_62) : nat * nat :=
  (v70_x_62 p, v70_y_62 p).

Definition v70_from_pair_62 (p : nat * nat) : v70_point_62 :=
  {| v70_x_62 := fst p; v70_y_62 := snd p |}.

Theorem v70_pair_roundtrip_62 : forall p : nat * nat,
  v70_to_pair_62 (v70_from_pair_62 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_62 : forall p : v70_point_62,
  fst (v70_to_pair_62 p) = v70_x_62 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_062.


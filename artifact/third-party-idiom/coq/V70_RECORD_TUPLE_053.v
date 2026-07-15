Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_053.
Record v70_point_53 := {
  v70_x_53 : nat;
  v70_y_53 : nat
}.

Definition v70_to_pair_53 (p : v70_point_53) : nat * nat :=
  (v70_x_53 p, v70_y_53 p).

Definition v70_from_pair_53 (p : nat * nat) : v70_point_53 :=
  {| v70_x_53 := fst p; v70_y_53 := snd p |}.

Theorem v70_pair_roundtrip_53 : forall p : nat * nat,
  v70_to_pair_53 (v70_from_pair_53 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_53 : forall p : v70_point_53,
  fst (v70_to_pair_53 p) = v70_x_53 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_053.


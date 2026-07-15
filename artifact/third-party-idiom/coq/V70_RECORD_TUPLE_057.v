Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_057.
Record v70_point_57 := {
  v70_x_57 : nat;
  v70_y_57 : nat
}.

Definition v70_to_pair_57 (p : v70_point_57) : nat * nat :=
  (v70_x_57 p, v70_y_57 p).

Definition v70_from_pair_57 (p : nat * nat) : v70_point_57 :=
  {| v70_x_57 := fst p; v70_y_57 := snd p |}.

Theorem v70_pair_roundtrip_57 : forall p : nat * nat,
  v70_to_pair_57 (v70_from_pair_57 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_57 : forall p : v70_point_57,
  fst (v70_to_pair_57 p) = v70_x_57 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_057.


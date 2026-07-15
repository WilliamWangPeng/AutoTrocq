Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_047.
Record v70_point_47 := {
  v70_x_47 : nat;
  v70_y_47 : nat
}.

Definition v70_to_pair_47 (p : v70_point_47) : nat * nat :=
  (v70_x_47 p, v70_y_47 p).

Definition v70_from_pair_47 (p : nat * nat) : v70_point_47 :=
  {| v70_x_47 := fst p; v70_y_47 := snd p |}.

Theorem v70_pair_roundtrip_47 : forall p : nat * nat,
  v70_to_pair_47 (v70_from_pair_47 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_47 : forall p : v70_point_47,
  fst (v70_to_pair_47 p) = v70_x_47 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_047.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_037.
Record v70_point_37 := {
  v70_x_37 : nat;
  v70_y_37 : nat
}.

Definition v70_to_pair_37 (p : v70_point_37) : nat * nat :=
  (v70_x_37 p, v70_y_37 p).

Definition v70_from_pair_37 (p : nat * nat) : v70_point_37 :=
  {| v70_x_37 := fst p; v70_y_37 := snd p |}.

Theorem v70_pair_roundtrip_37 : forall p : nat * nat,
  v70_to_pair_37 (v70_from_pair_37 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_37 : forall p : v70_point_37,
  fst (v70_to_pair_37 p) = v70_x_37 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_037.


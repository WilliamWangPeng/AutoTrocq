Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_038.
Record v70_point_38 := {
  v70_x_38 : nat;
  v70_y_38 : nat
}.

Definition v70_to_pair_38 (p : v70_point_38) : nat * nat :=
  (v70_x_38 p, v70_y_38 p).

Definition v70_from_pair_38 (p : nat * nat) : v70_point_38 :=
  {| v70_x_38 := fst p; v70_y_38 := snd p |}.

Theorem v70_pair_roundtrip_38 : forall p : nat * nat,
  v70_to_pair_38 (v70_from_pair_38 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_38 : forall p : v70_point_38,
  fst (v70_to_pair_38 p) = v70_x_38 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_038.


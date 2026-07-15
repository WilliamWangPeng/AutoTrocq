Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_043.
Record v70_point_43 := {
  v70_x_43 : nat;
  v70_y_43 : nat
}.

Definition v70_to_pair_43 (p : v70_point_43) : nat * nat :=
  (v70_x_43 p, v70_y_43 p).

Definition v70_from_pair_43 (p : nat * nat) : v70_point_43 :=
  {| v70_x_43 := fst p; v70_y_43 := snd p |}.

Theorem v70_pair_roundtrip_43 : forall p : nat * nat,
  v70_to_pair_43 (v70_from_pair_43 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_43 : forall p : v70_point_43,
  fst (v70_to_pair_43 p) = v70_x_43 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_043.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_068.
Record v70_point_68 := {
  v70_x_68 : nat;
  v70_y_68 : nat
}.

Definition v70_to_pair_68 (p : v70_point_68) : nat * nat :=
  (v70_x_68 p, v70_y_68 p).

Definition v70_from_pair_68 (p : nat * nat) : v70_point_68 :=
  {| v70_x_68 := fst p; v70_y_68 := snd p |}.

Theorem v70_pair_roundtrip_68 : forall p : nat * nat,
  v70_to_pair_68 (v70_from_pair_68 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_68 : forall p : v70_point_68,
  fst (v70_to_pair_68 p) = v70_x_68 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_068.


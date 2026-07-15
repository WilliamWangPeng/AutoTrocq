Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_RECORD_TUPLE_077.
Record v70_point_77 := {
  v70_x_77 : nat;
  v70_y_77 : nat
}.

Definition v70_to_pair_77 (p : v70_point_77) : nat * nat :=
  (v70_x_77 p, v70_y_77 p).

Definition v70_from_pair_77 (p : nat * nat) : v70_point_77 :=
  {| v70_x_77 := fst p; v70_y_77 := snd p |}.

Theorem v70_pair_roundtrip_77 : forall p : nat * nat,
  v70_to_pair_77 (v70_from_pair_77 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_projection_preserved_77 : forall p : v70_point_77,
  fst (v70_to_pair_77 p) = v70_x_77 p.
Proof.
  destruct p. reflexivity.
Qed.
End V70_RECORD_TUPLE_077.


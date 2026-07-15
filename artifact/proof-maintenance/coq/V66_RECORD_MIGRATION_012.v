Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_012.
Record v66_point_12 := {
  v66_x_12 : nat;
  v66_y_12 : nat
}.

Definition v66_to_pair_12 (p : v66_point_12) : nat * nat :=
  (v66_x_12 p, v66_y_12 p).

Definition v66_from_pair_12 (p : nat * nat) : v66_point_12 :=
  {| v66_x_12 := fst p; v66_y_12 := snd p |}.

Theorem v66_pair_roundtrip_12 : forall p : nat * nat,
  v66_to_pair_12 (v66_from_pair_12 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_12 : forall p : v66_point_12,
  fst (v66_to_pair_12 p) = v66_x_12 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_012.


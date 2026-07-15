Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_050.
Record v66_point_50 := {
  v66_x_50 : nat;
  v66_y_50 : nat
}.

Definition v66_to_pair_50 (p : v66_point_50) : nat * nat :=
  (v66_x_50 p, v66_y_50 p).

Definition v66_from_pair_50 (p : nat * nat) : v66_point_50 :=
  {| v66_x_50 := fst p; v66_y_50 := snd p |}.

Theorem v66_pair_roundtrip_50 : forall p : nat * nat,
  v66_to_pair_50 (v66_from_pair_50 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_50 : forall p : v66_point_50,
  fst (v66_to_pair_50 p) = v66_x_50 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_050.


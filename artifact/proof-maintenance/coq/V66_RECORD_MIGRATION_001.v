Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_001.
Record v66_point_1 := {
  v66_x_1 : nat;
  v66_y_1 : nat
}.

Definition v66_to_pair_1 (p : v66_point_1) : nat * nat :=
  (v66_x_1 p, v66_y_1 p).

Definition v66_from_pair_1 (p : nat * nat) : v66_point_1 :=
  {| v66_x_1 := fst p; v66_y_1 := snd p |}.

Theorem v66_pair_roundtrip_1 : forall p : nat * nat,
  v66_to_pair_1 (v66_from_pair_1 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_1 : forall p : v66_point_1,
  fst (v66_to_pair_1 p) = v66_x_1 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_001.


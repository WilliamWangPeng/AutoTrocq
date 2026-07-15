Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_013.
Record v66_point_13 := {
  v66_x_13 : nat;
  v66_y_13 : nat
}.

Definition v66_to_pair_13 (p : v66_point_13) : nat * nat :=
  (v66_x_13 p, v66_y_13 p).

Definition v66_from_pair_13 (p : nat * nat) : v66_point_13 :=
  {| v66_x_13 := fst p; v66_y_13 := snd p |}.

Theorem v66_pair_roundtrip_13 : forall p : nat * nat,
  v66_to_pair_13 (v66_from_pair_13 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_13 : forall p : v66_point_13,
  fst (v66_to_pair_13 p) = v66_x_13 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_013.


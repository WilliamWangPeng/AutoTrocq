Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_015.
Record v66_point_15 := {
  v66_x_15 : nat;
  v66_y_15 : nat
}.

Definition v66_to_pair_15 (p : v66_point_15) : nat * nat :=
  (v66_x_15 p, v66_y_15 p).

Definition v66_from_pair_15 (p : nat * nat) : v66_point_15 :=
  {| v66_x_15 := fst p; v66_y_15 := snd p |}.

Theorem v66_pair_roundtrip_15 : forall p : nat * nat,
  v66_to_pair_15 (v66_from_pair_15 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_15 : forall p : v66_point_15,
  fst (v66_to_pair_15 p) = v66_x_15 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_015.


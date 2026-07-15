Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_014.
Record v66_point_14 := {
  v66_x_14 : nat;
  v66_y_14 : nat
}.

Definition v66_to_pair_14 (p : v66_point_14) : nat * nat :=
  (v66_x_14 p, v66_y_14 p).

Definition v66_from_pair_14 (p : nat * nat) : v66_point_14 :=
  {| v66_x_14 := fst p; v66_y_14 := snd p |}.

Theorem v66_pair_roundtrip_14 : forall p : nat * nat,
  v66_to_pair_14 (v66_from_pair_14 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_14 : forall p : v66_point_14,
  fst (v66_to_pair_14 p) = v66_x_14 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_014.


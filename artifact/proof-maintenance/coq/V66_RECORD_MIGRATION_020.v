Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_020.
Record v66_point_20 := {
  v66_x_20 : nat;
  v66_y_20 : nat
}.

Definition v66_to_pair_20 (p : v66_point_20) : nat * nat :=
  (v66_x_20 p, v66_y_20 p).

Definition v66_from_pair_20 (p : nat * nat) : v66_point_20 :=
  {| v66_x_20 := fst p; v66_y_20 := snd p |}.

Theorem v66_pair_roundtrip_20 : forall p : nat * nat,
  v66_to_pair_20 (v66_from_pair_20 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_20 : forall p : v66_point_20,
  fst (v66_to_pair_20 p) = v66_x_20 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_020.


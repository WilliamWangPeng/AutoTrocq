Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_032.
Record v66_point_32 := {
  v66_x_32 : nat;
  v66_y_32 : nat
}.

Definition v66_to_pair_32 (p : v66_point_32) : nat * nat :=
  (v66_x_32 p, v66_y_32 p).

Definition v66_from_pair_32 (p : nat * nat) : v66_point_32 :=
  {| v66_x_32 := fst p; v66_y_32 := snd p |}.

Theorem v66_pair_roundtrip_32 : forall p : nat * nat,
  v66_to_pair_32 (v66_from_pair_32 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_32 : forall p : v66_point_32,
  fst (v66_to_pair_32 p) = v66_x_32 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_032.


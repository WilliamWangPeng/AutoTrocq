Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_016.
Record v66_point_16 := {
  v66_x_16 : nat;
  v66_y_16 : nat
}.

Definition v66_to_pair_16 (p : v66_point_16) : nat * nat :=
  (v66_x_16 p, v66_y_16 p).

Definition v66_from_pair_16 (p : nat * nat) : v66_point_16 :=
  {| v66_x_16 := fst p; v66_y_16 := snd p |}.

Theorem v66_pair_roundtrip_16 : forall p : nat * nat,
  v66_to_pair_16 (v66_from_pair_16 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_16 : forall p : v66_point_16,
  fst (v66_to_pair_16 p) = v66_x_16 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_016.


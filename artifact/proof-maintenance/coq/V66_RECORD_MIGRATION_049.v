Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_049.
Record v66_point_49 := {
  v66_x_49 : nat;
  v66_y_49 : nat
}.

Definition v66_to_pair_49 (p : v66_point_49) : nat * nat :=
  (v66_x_49 p, v66_y_49 p).

Definition v66_from_pair_49 (p : nat * nat) : v66_point_49 :=
  {| v66_x_49 := fst p; v66_y_49 := snd p |}.

Theorem v66_pair_roundtrip_49 : forall p : nat * nat,
  v66_to_pair_49 (v66_from_pair_49 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_49 : forall p : v66_point_49,
  fst (v66_to_pair_49 p) = v66_x_49 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_049.


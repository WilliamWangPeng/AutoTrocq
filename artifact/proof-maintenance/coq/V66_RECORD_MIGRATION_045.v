Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_045.
Record v66_point_45 := {
  v66_x_45 : nat;
  v66_y_45 : nat
}.

Definition v66_to_pair_45 (p : v66_point_45) : nat * nat :=
  (v66_x_45 p, v66_y_45 p).

Definition v66_from_pair_45 (p : nat * nat) : v66_point_45 :=
  {| v66_x_45 := fst p; v66_y_45 := snd p |}.

Theorem v66_pair_roundtrip_45 : forall p : nat * nat,
  v66_to_pair_45 (v66_from_pair_45 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_45 : forall p : v66_point_45,
  fst (v66_to_pair_45 p) = v66_x_45 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_045.


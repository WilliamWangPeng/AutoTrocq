Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_023.
Record v66_point_23 := {
  v66_x_23 : nat;
  v66_y_23 : nat
}.

Definition v66_to_pair_23 (p : v66_point_23) : nat * nat :=
  (v66_x_23 p, v66_y_23 p).

Definition v66_from_pair_23 (p : nat * nat) : v66_point_23 :=
  {| v66_x_23 := fst p; v66_y_23 := snd p |}.

Theorem v66_pair_roundtrip_23 : forall p : nat * nat,
  v66_to_pair_23 (v66_from_pair_23 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_23 : forall p : v66_point_23,
  fst (v66_to_pair_23 p) = v66_x_23 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_023.


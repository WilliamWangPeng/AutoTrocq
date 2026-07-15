Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_042.
Record v66_point_42 := {
  v66_x_42 : nat;
  v66_y_42 : nat
}.

Definition v66_to_pair_42 (p : v66_point_42) : nat * nat :=
  (v66_x_42 p, v66_y_42 p).

Definition v66_from_pair_42 (p : nat * nat) : v66_point_42 :=
  {| v66_x_42 := fst p; v66_y_42 := snd p |}.

Theorem v66_pair_roundtrip_42 : forall p : nat * nat,
  v66_to_pair_42 (v66_from_pair_42 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_42 : forall p : v66_point_42,
  fst (v66_to_pair_42 p) = v66_x_42 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_042.


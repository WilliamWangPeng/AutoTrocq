Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_026.
Record v66_point_26 := {
  v66_x_26 : nat;
  v66_y_26 : nat
}.

Definition v66_to_pair_26 (p : v66_point_26) : nat * nat :=
  (v66_x_26 p, v66_y_26 p).

Definition v66_from_pair_26 (p : nat * nat) : v66_point_26 :=
  {| v66_x_26 := fst p; v66_y_26 := snd p |}.

Theorem v66_pair_roundtrip_26 : forall p : nat * nat,
  v66_to_pair_26 (v66_from_pair_26 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_26 : forall p : v66_point_26,
  fst (v66_to_pair_26 p) = v66_x_26 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_026.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_035.
Record v66_point_35 := {
  v66_x_35 : nat;
  v66_y_35 : nat
}.

Definition v66_to_pair_35 (p : v66_point_35) : nat * nat :=
  (v66_x_35 p, v66_y_35 p).

Definition v66_from_pair_35 (p : nat * nat) : v66_point_35 :=
  {| v66_x_35 := fst p; v66_y_35 := snd p |}.

Theorem v66_pair_roundtrip_35 : forall p : nat * nat,
  v66_to_pair_35 (v66_from_pair_35 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_35 : forall p : v66_point_35,
  fst (v66_to_pair_35 p) = v66_x_35 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_035.


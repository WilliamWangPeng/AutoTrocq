Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_040.
Record v66_point_40 := {
  v66_x_40 : nat;
  v66_y_40 : nat
}.

Definition v66_to_pair_40 (p : v66_point_40) : nat * nat :=
  (v66_x_40 p, v66_y_40 p).

Definition v66_from_pair_40 (p : nat * nat) : v66_point_40 :=
  {| v66_x_40 := fst p; v66_y_40 := snd p |}.

Theorem v66_pair_roundtrip_40 : forall p : nat * nat,
  v66_to_pair_40 (v66_from_pair_40 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_40 : forall p : v66_point_40,
  fst (v66_to_pair_40 p) = v66_x_40 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_040.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_005.
Record v66_point_5 := {
  v66_x_5 : nat;
  v66_y_5 : nat
}.

Definition v66_to_pair_5 (p : v66_point_5) : nat * nat :=
  (v66_x_5 p, v66_y_5 p).

Definition v66_from_pair_5 (p : nat * nat) : v66_point_5 :=
  {| v66_x_5 := fst p; v66_y_5 := snd p |}.

Theorem v66_pair_roundtrip_5 : forall p : nat * nat,
  v66_to_pair_5 (v66_from_pair_5 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_5 : forall p : v66_point_5,
  fst (v66_to_pair_5 p) = v66_x_5 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_005.


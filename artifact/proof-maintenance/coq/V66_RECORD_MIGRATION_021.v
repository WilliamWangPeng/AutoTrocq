Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_021.
Record v66_point_21 := {
  v66_x_21 : nat;
  v66_y_21 : nat
}.

Definition v66_to_pair_21 (p : v66_point_21) : nat * nat :=
  (v66_x_21 p, v66_y_21 p).

Definition v66_from_pair_21 (p : nat * nat) : v66_point_21 :=
  {| v66_x_21 := fst p; v66_y_21 := snd p |}.

Theorem v66_pair_roundtrip_21 : forall p : nat * nat,
  v66_to_pair_21 (v66_from_pair_21 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_21 : forall p : v66_point_21,
  fst (v66_to_pair_21 p) = v66_x_21 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_021.


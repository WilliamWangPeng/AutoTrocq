Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_010.
Record v66_point_10 := {
  v66_x_10 : nat;
  v66_y_10 : nat
}.

Definition v66_to_pair_10 (p : v66_point_10) : nat * nat :=
  (v66_x_10 p, v66_y_10 p).

Definition v66_from_pair_10 (p : nat * nat) : v66_point_10 :=
  {| v66_x_10 := fst p; v66_y_10 := snd p |}.

Theorem v66_pair_roundtrip_10 : forall p : nat * nat,
  v66_to_pair_10 (v66_from_pair_10 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_10 : forall p : v66_point_10,
  fst (v66_to_pair_10 p) = v66_x_10 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_010.


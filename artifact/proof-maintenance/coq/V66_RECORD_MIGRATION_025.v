Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_025.
Record v66_point_25 := {
  v66_x_25 : nat;
  v66_y_25 : nat
}.

Definition v66_to_pair_25 (p : v66_point_25) : nat * nat :=
  (v66_x_25 p, v66_y_25 p).

Definition v66_from_pair_25 (p : nat * nat) : v66_point_25 :=
  {| v66_x_25 := fst p; v66_y_25 := snd p |}.

Theorem v66_pair_roundtrip_25 : forall p : nat * nat,
  v66_to_pair_25 (v66_from_pair_25 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_25 : forall p : v66_point_25,
  fst (v66_to_pair_25 p) = v66_x_25 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_025.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_004.
Record v66_point_4 := {
  v66_x_4 : nat;
  v66_y_4 : nat
}.

Definition v66_to_pair_4 (p : v66_point_4) : nat * nat :=
  (v66_x_4 p, v66_y_4 p).

Definition v66_from_pair_4 (p : nat * nat) : v66_point_4 :=
  {| v66_x_4 := fst p; v66_y_4 := snd p |}.

Theorem v66_pair_roundtrip_4 : forall p : nat * nat,
  v66_to_pair_4 (v66_from_pair_4 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_4 : forall p : v66_point_4,
  fst (v66_to_pair_4 p) = v66_x_4 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_004.


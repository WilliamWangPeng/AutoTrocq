Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_036.
Record v66_point_36 := {
  v66_x_36 : nat;
  v66_y_36 : nat
}.

Definition v66_to_pair_36 (p : v66_point_36) : nat * nat :=
  (v66_x_36 p, v66_y_36 p).

Definition v66_from_pair_36 (p : nat * nat) : v66_point_36 :=
  {| v66_x_36 := fst p; v66_y_36 := snd p |}.

Theorem v66_pair_roundtrip_36 : forall p : nat * nat,
  v66_to_pair_36 (v66_from_pair_36 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_36 : forall p : v66_point_36,
  fst (v66_to_pair_36 p) = v66_x_36 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_036.


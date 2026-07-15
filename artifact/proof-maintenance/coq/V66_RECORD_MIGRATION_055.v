Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_055.
Record v66_point_55 := {
  v66_x_55 : nat;
  v66_y_55 : nat
}.

Definition v66_to_pair_55 (p : v66_point_55) : nat * nat :=
  (v66_x_55 p, v66_y_55 p).

Definition v66_from_pair_55 (p : nat * nat) : v66_point_55 :=
  {| v66_x_55 := fst p; v66_y_55 := snd p |}.

Theorem v66_pair_roundtrip_55 : forall p : nat * nat,
  v66_to_pair_55 (v66_from_pair_55 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_55 : forall p : v66_point_55,
  fst (v66_to_pair_55 p) = v66_x_55 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_055.


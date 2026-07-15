Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_060.
Record v66_point_60 := {
  v66_x_60 : nat;
  v66_y_60 : nat
}.

Definition v66_to_pair_60 (p : v66_point_60) : nat * nat :=
  (v66_x_60 p, v66_y_60 p).

Definition v66_from_pair_60 (p : nat * nat) : v66_point_60 :=
  {| v66_x_60 := fst p; v66_y_60 := snd p |}.

Theorem v66_pair_roundtrip_60 : forall p : nat * nat,
  v66_to_pair_60 (v66_from_pair_60 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_60 : forall p : v66_point_60,
  fst (v66_to_pair_60 p) = v66_x_60 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_060.


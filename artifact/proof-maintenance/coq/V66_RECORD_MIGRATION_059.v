Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_059.
Record v66_point_59 := {
  v66_x_59 : nat;
  v66_y_59 : nat
}.

Definition v66_to_pair_59 (p : v66_point_59) : nat * nat :=
  (v66_x_59 p, v66_y_59 p).

Definition v66_from_pair_59 (p : nat * nat) : v66_point_59 :=
  {| v66_x_59 := fst p; v66_y_59 := snd p |}.

Theorem v66_pair_roundtrip_59 : forall p : nat * nat,
  v66_to_pair_59 (v66_from_pair_59 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_59 : forall p : v66_point_59,
  fst (v66_to_pair_59 p) = v66_x_59 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_059.


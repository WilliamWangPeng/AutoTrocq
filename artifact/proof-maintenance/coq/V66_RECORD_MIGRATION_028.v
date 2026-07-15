Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_028.
Record v66_point_28 := {
  v66_x_28 : nat;
  v66_y_28 : nat
}.

Definition v66_to_pair_28 (p : v66_point_28) : nat * nat :=
  (v66_x_28 p, v66_y_28 p).

Definition v66_from_pair_28 (p : nat * nat) : v66_point_28 :=
  {| v66_x_28 := fst p; v66_y_28 := snd p |}.

Theorem v66_pair_roundtrip_28 : forall p : nat * nat,
  v66_to_pair_28 (v66_from_pair_28 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_28 : forall p : v66_point_28,
  fst (v66_to_pair_28 p) = v66_x_28 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_028.


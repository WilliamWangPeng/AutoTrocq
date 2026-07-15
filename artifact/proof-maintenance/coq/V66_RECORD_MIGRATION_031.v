Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_031.
Record v66_point_31 := {
  v66_x_31 : nat;
  v66_y_31 : nat
}.

Definition v66_to_pair_31 (p : v66_point_31) : nat * nat :=
  (v66_x_31 p, v66_y_31 p).

Definition v66_from_pair_31 (p : nat * nat) : v66_point_31 :=
  {| v66_x_31 := fst p; v66_y_31 := snd p |}.

Theorem v66_pair_roundtrip_31 : forall p : nat * nat,
  v66_to_pair_31 (v66_from_pair_31 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_31 : forall p : v66_point_31,
  fst (v66_to_pair_31 p) = v66_x_31 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_031.


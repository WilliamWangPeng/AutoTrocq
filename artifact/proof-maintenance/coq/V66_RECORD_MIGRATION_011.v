Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_011.
Record v66_point_11 := {
  v66_x_11 : nat;
  v66_y_11 : nat
}.

Definition v66_to_pair_11 (p : v66_point_11) : nat * nat :=
  (v66_x_11 p, v66_y_11 p).

Definition v66_from_pair_11 (p : nat * nat) : v66_point_11 :=
  {| v66_x_11 := fst p; v66_y_11 := snd p |}.

Theorem v66_pair_roundtrip_11 : forall p : nat * nat,
  v66_to_pair_11 (v66_from_pair_11 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_11 : forall p : v66_point_11,
  fst (v66_to_pair_11 p) = v66_x_11 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_011.


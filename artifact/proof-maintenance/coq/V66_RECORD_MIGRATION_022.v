Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_022.
Record v66_point_22 := {
  v66_x_22 : nat;
  v66_y_22 : nat
}.

Definition v66_to_pair_22 (p : v66_point_22) : nat * nat :=
  (v66_x_22 p, v66_y_22 p).

Definition v66_from_pair_22 (p : nat * nat) : v66_point_22 :=
  {| v66_x_22 := fst p; v66_y_22 := snd p |}.

Theorem v66_pair_roundtrip_22 : forall p : nat * nat,
  v66_to_pair_22 (v66_from_pair_22 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_22 : forall p : v66_point_22,
  fst (v66_to_pair_22 p) = v66_x_22 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_022.


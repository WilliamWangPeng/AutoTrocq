Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_018.
Record v66_point_18 := {
  v66_x_18 : nat;
  v66_y_18 : nat
}.

Definition v66_to_pair_18 (p : v66_point_18) : nat * nat :=
  (v66_x_18 p, v66_y_18 p).

Definition v66_from_pair_18 (p : nat * nat) : v66_point_18 :=
  {| v66_x_18 := fst p; v66_y_18 := snd p |}.

Theorem v66_pair_roundtrip_18 : forall p : nat * nat,
  v66_to_pair_18 (v66_from_pair_18 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_18 : forall p : v66_point_18,
  fst (v66_to_pair_18 p) = v66_x_18 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_018.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_029.
Record v66_point_29 := {
  v66_x_29 : nat;
  v66_y_29 : nat
}.

Definition v66_to_pair_29 (p : v66_point_29) : nat * nat :=
  (v66_x_29 p, v66_y_29 p).

Definition v66_from_pair_29 (p : nat * nat) : v66_point_29 :=
  {| v66_x_29 := fst p; v66_y_29 := snd p |}.

Theorem v66_pair_roundtrip_29 : forall p : nat * nat,
  v66_to_pair_29 (v66_from_pair_29 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_29 : forall p : v66_point_29,
  fst (v66_to_pair_29 p) = v66_x_29 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_029.


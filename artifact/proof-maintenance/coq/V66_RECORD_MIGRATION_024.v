Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_024.
Record v66_point_24 := {
  v66_x_24 : nat;
  v66_y_24 : nat
}.

Definition v66_to_pair_24 (p : v66_point_24) : nat * nat :=
  (v66_x_24 p, v66_y_24 p).

Definition v66_from_pair_24 (p : nat * nat) : v66_point_24 :=
  {| v66_x_24 := fst p; v66_y_24 := snd p |}.

Theorem v66_pair_roundtrip_24 : forall p : nat * nat,
  v66_to_pair_24 (v66_from_pair_24 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_24 : forall p : v66_point_24,
  fst (v66_to_pair_24 p) = v66_x_24 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_024.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_003.
Record v66_point_3 := {
  v66_x_3 : nat;
  v66_y_3 : nat
}.

Definition v66_to_pair_3 (p : v66_point_3) : nat * nat :=
  (v66_x_3 p, v66_y_3 p).

Definition v66_from_pair_3 (p : nat * nat) : v66_point_3 :=
  {| v66_x_3 := fst p; v66_y_3 := snd p |}.

Theorem v66_pair_roundtrip_3 : forall p : nat * nat,
  v66_to_pair_3 (v66_from_pair_3 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_3 : forall p : v66_point_3,
  fst (v66_to_pair_3 p) = v66_x_3 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_003.


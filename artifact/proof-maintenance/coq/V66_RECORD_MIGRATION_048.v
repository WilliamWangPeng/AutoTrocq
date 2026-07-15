Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_048.
Record v66_point_48 := {
  v66_x_48 : nat;
  v66_y_48 : nat
}.

Definition v66_to_pair_48 (p : v66_point_48) : nat * nat :=
  (v66_x_48 p, v66_y_48 p).

Definition v66_from_pair_48 (p : nat * nat) : v66_point_48 :=
  {| v66_x_48 := fst p; v66_y_48 := snd p |}.

Theorem v66_pair_roundtrip_48 : forall p : nat * nat,
  v66_to_pair_48 (v66_from_pair_48 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_48 : forall p : v66_point_48,
  fst (v66_to_pair_48 p) = v66_x_48 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_048.


Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_039.
Record v66_point_39 := {
  v66_x_39 : nat;
  v66_y_39 : nat
}.

Definition v66_to_pair_39 (p : v66_point_39) : nat * nat :=
  (v66_x_39 p, v66_y_39 p).

Definition v66_from_pair_39 (p : nat * nat) : v66_point_39 :=
  {| v66_x_39 := fst p; v66_y_39 := snd p |}.

Theorem v66_pair_roundtrip_39 : forall p : nat * nat,
  v66_to_pair_39 (v66_from_pair_39 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_39 : forall p : v66_point_39,
  fst (v66_to_pair_39 p) = v66_x_39 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_039.


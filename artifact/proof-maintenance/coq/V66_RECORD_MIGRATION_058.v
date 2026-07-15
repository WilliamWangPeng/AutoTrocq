Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_058.
Record v66_point_58 := {
  v66_x_58 : nat;
  v66_y_58 : nat
}.

Definition v66_to_pair_58 (p : v66_point_58) : nat * nat :=
  (v66_x_58 p, v66_y_58 p).

Definition v66_from_pair_58 (p : nat * nat) : v66_point_58 :=
  {| v66_x_58 := fst p; v66_y_58 := snd p |}.

Theorem v66_pair_roundtrip_58 : forall p : nat * nat,
  v66_to_pair_58 (v66_from_pair_58 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_58 : forall p : v66_point_58,
  fst (v66_to_pair_58 p) = v66_x_58 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_058.


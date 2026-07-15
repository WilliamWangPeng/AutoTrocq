Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_051.
Record v66_point_51 := {
  v66_x_51 : nat;
  v66_y_51 : nat
}.

Definition v66_to_pair_51 (p : v66_point_51) : nat * nat :=
  (v66_x_51 p, v66_y_51 p).

Definition v66_from_pair_51 (p : nat * nat) : v66_point_51 :=
  {| v66_x_51 := fst p; v66_y_51 := snd p |}.

Theorem v66_pair_roundtrip_51 : forall p : nat * nat,
  v66_to_pair_51 (v66_from_pair_51 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_51 : forall p : v66_point_51,
  fst (v66_to_pair_51 p) = v66_x_51 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_051.


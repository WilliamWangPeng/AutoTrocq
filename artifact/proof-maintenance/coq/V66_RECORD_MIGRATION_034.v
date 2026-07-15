Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_034.
Record v66_point_34 := {
  v66_x_34 : nat;
  v66_y_34 : nat
}.

Definition v66_to_pair_34 (p : v66_point_34) : nat * nat :=
  (v66_x_34 p, v66_y_34 p).

Definition v66_from_pair_34 (p : nat * nat) : v66_point_34 :=
  {| v66_x_34 := fst p; v66_y_34 := snd p |}.

Theorem v66_pair_roundtrip_34 : forall p : nat * nat,
  v66_to_pair_34 (v66_from_pair_34 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_34 : forall p : v66_point_34,
  fst (v66_to_pair_34 p) = v66_x_34 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_034.


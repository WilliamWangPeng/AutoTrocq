Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_052.
Record v66_point_52 := {
  v66_x_52 : nat;
  v66_y_52 : nat
}.

Definition v66_to_pair_52 (p : v66_point_52) : nat * nat :=
  (v66_x_52 p, v66_y_52 p).

Definition v66_from_pair_52 (p : nat * nat) : v66_point_52 :=
  {| v66_x_52 := fst p; v66_y_52 := snd p |}.

Theorem v66_pair_roundtrip_52 : forall p : nat * nat,
  v66_to_pair_52 (v66_from_pair_52 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_52 : forall p : v66_point_52,
  fst (v66_to_pair_52 p) = v66_x_52 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_052.


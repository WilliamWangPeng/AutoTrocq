Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_047.
Record v66_point_47 := {
  v66_x_47 : nat;
  v66_y_47 : nat
}.

Definition v66_to_pair_47 (p : v66_point_47) : nat * nat :=
  (v66_x_47 p, v66_y_47 p).

Definition v66_from_pair_47 (p : nat * nat) : v66_point_47 :=
  {| v66_x_47 := fst p; v66_y_47 := snd p |}.

Theorem v66_pair_roundtrip_47 : forall p : nat * nat,
  v66_to_pair_47 (v66_from_pair_47 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_47 : forall p : v66_point_47,
  fst (v66_to_pair_47 p) = v66_x_47 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_047.


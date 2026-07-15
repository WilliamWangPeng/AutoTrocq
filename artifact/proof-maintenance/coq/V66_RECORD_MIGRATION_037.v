Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_037.
Record v66_point_37 := {
  v66_x_37 : nat;
  v66_y_37 : nat
}.

Definition v66_to_pair_37 (p : v66_point_37) : nat * nat :=
  (v66_x_37 p, v66_y_37 p).

Definition v66_from_pair_37 (p : nat * nat) : v66_point_37 :=
  {| v66_x_37 := fst p; v66_y_37 := snd p |}.

Theorem v66_pair_roundtrip_37 : forall p : nat * nat,
  v66_to_pair_37 (v66_from_pair_37 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_37 : forall p : v66_point_37,
  fst (v66_to_pair_37 p) = v66_x_37 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_037.


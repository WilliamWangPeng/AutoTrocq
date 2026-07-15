Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_027.
Record v66_point_27 := {
  v66_x_27 : nat;
  v66_y_27 : nat
}.

Definition v66_to_pair_27 (p : v66_point_27) : nat * nat :=
  (v66_x_27 p, v66_y_27 p).

Definition v66_from_pair_27 (p : nat * nat) : v66_point_27 :=
  {| v66_x_27 := fst p; v66_y_27 := snd p |}.

Theorem v66_pair_roundtrip_27 : forall p : nat * nat,
  v66_to_pair_27 (v66_from_pair_27 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_27 : forall p : v66_point_27,
  fst (v66_to_pair_27 p) = v66_x_27 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_027.


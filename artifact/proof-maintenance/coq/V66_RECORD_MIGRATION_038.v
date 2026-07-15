Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_RECORD_MIGRATION_038.
Record v66_point_38 := {
  v66_x_38 : nat;
  v66_y_38 : nat
}.

Definition v66_to_pair_38 (p : v66_point_38) : nat * nat :=
  (v66_x_38 p, v66_y_38 p).

Definition v66_from_pair_38 (p : nat * nat) : v66_point_38 :=
  {| v66_x_38 := fst p; v66_y_38 := snd p |}.

Theorem v66_pair_roundtrip_38 : forall p : nat * nat,
  v66_to_pair_38 (v66_from_pair_38 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_projection_preserved_38 : forall p : v66_point_38,
  fst (v66_to_pair_38 p) = v66_x_38 p.
Proof.
  destruct p. reflexivity.
Qed.
End V66_RECORD_MIGRATION_038.


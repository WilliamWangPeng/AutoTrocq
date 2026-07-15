Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_NAT_REWRITE_MAINTENANCE_059.
Theorem v66_add_assoc_59 : forall a b c : nat,
  a + (b + c) = (a + b) + c.
Proof.
  intros. rewrite Nat.add_assoc. reflexivity.
Qed.

Theorem v66_add_comm_zero_59 : forall a b : nat,
  a + b + 0 = b + a.
Proof.
  intros. rewrite Nat.add_0_r. apply Nat.add_comm.
Qed.
End V66_NAT_REWRITE_MAINTENANCE_059.


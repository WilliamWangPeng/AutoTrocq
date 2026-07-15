Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_NAT_ORDER_029.
Definition v70_bound_29 (n m : nat) : nat := Nat.max n m.

Theorem v70_bound_comm_29 : forall n m : nat,
  v70_bound_29 n m = v70_bound_29 m n.
Proof.
  intros n m. unfold v70_bound_29. apply Nat.max_comm.
Qed.

Theorem v70_bound_left_29 : forall n m : nat,
  m <= n -> v70_bound_29 n m = n.
Proof.
  intros n m H. unfold v70_bound_29. now apply Nat.max_l.
Qed.
End V70_NAT_ORDER_029.


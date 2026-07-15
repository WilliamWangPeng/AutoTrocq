Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_NAT_ORDER_063.
Definition v70_bound_63 (n m : nat) : nat := Nat.max n m.

Theorem v70_bound_comm_63 : forall n m : nat,
  v70_bound_63 n m = v70_bound_63 m n.
Proof.
  intros n m. unfold v70_bound_63. apply Nat.max_comm.
Qed.

Theorem v70_bound_left_63 : forall n m : nat,
  m <= n -> v70_bound_63 n m = n.
Proof.
  intros n m H. unfold v70_bound_63. now apply Nat.max_l.
Qed.
End V70_NAT_ORDER_063.


(* V65 standard-library interoperability module *)
(* FAMILY: nat-max *)
(* OBLIGATIONS: 2 *)

Module V65_NAT_MAX_006.
Require Import Coq.Arith.PeanoNat.

Definition max_pair_6 (n m : nat) : nat := Nat.max n m.

Theorem max_pair_comm_6 : forall n m : nat, max_pair_6 n m = max_pair_6 m n.
Proof.
  intros n m.
  unfold max_pair_6.
  apply Nat.max_comm.
Qed.

Theorem max_pair_left_6 : forall n m : nat, m <= n -> max_pair_6 n m = n.
Proof.
  intros n m H.
  unfold max_pair_6.
  now apply Nat.max_l.
Qed.
End V65_NAT_MAX_006.


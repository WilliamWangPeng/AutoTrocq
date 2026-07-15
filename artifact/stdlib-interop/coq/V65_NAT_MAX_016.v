(* V65 standard-library interoperability module *)
(* FAMILY: nat-max *)
(* OBLIGATIONS: 2 *)

Module V65_NAT_MAX_016.
Require Import Coq.Arith.PeanoNat.

Definition max_pair_16 (n m : nat) : nat := Nat.max n m.

Theorem max_pair_comm_16 : forall n m : nat, max_pair_16 n m = max_pair_16 m n.
Proof.
  intros n m.
  unfold max_pair_16.
  apply Nat.max_comm.
Qed.

Theorem max_pair_left_16 : forall n m : nat, m <= n -> max_pair_16 n m = n.
Proof.
  intros n m H.
  unfold max_pair_16.
  now apply Nat.max_l.
Qed.
End V65_NAT_MAX_016.


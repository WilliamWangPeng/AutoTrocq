(* V65 standard-library interoperability module *)
(* FAMILY: nat-max *)
(* OBLIGATIONS: 2 *)

Module V65_NAT_MAX_032.
Require Import Coq.Arith.PeanoNat.

Definition max_pair_32 (n m : nat) : nat := Nat.max n m.

Theorem max_pair_comm_32 : forall n m : nat, max_pair_32 n m = max_pair_32 m n.
Proof.
  intros n m.
  unfold max_pair_32.
  apply Nat.max_comm.
Qed.

Theorem max_pair_left_32 : forall n m : nat, m <= n -> max_pair_32 n m = n.
Proof.
  intros n m H.
  unfold max_pair_32.
  now apply Nat.max_l.
Qed.
End V65_NAT_MAX_032.


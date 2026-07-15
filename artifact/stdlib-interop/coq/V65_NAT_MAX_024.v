(* V65 standard-library interoperability module *)
(* FAMILY: nat-max *)
(* OBLIGATIONS: 2 *)

Module V65_NAT_MAX_024.
Require Import Coq.Arith.PeanoNat.

Definition max_pair_24 (n m : nat) : nat := Nat.max n m.

Theorem max_pair_comm_24 : forall n m : nat, max_pair_24 n m = max_pair_24 m n.
Proof.
  intros n m.
  unfold max_pair_24.
  apply Nat.max_comm.
Qed.

Theorem max_pair_left_24 : forall n m : nat, m <= n -> max_pair_24 n m = n.
Proof.
  intros n m H.
  unfold max_pair_24.
  now apply Nat.max_l.
Qed.
End V65_NAT_MAX_024.


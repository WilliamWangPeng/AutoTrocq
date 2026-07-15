(* V65 standard-library interoperability module *)
(* FAMILY: nat-add *)
(* OBLIGATIONS: 2 *)

Module V65_NAT_ADD_050.
Require Import Coq.Arith.PeanoNat.

Definition add_zero_50 (n : nat) : nat := n + 0.

Theorem add_zero_correct_50 : forall n : nat, add_zero_50 n = n.
Proof.
  intro n.
  unfold add_zero_50.
  now rewrite Nat.add_0_r.
Qed.

Theorem add_zero_commutes_50 : forall n m : nat, add_zero_50 (n + m) = m + n.
Proof.
  intros n m.
  unfold add_zero_50.
  rewrite Nat.add_0_r.
  now rewrite Nat.add_comm.
Qed.
End V65_NAT_ADD_050.


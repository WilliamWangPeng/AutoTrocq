(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_023.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_383 (x : nat) := x + 0.
Definition g_383 (x : nat) := x.
Theorem extensional_383 : f_383 = g_383.
Proof.
  apply functional_extensionality; intro x.
  unfold f_383, g_383.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_023.


(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_008.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_368 (x : nat) := x + 0.
Definition g_368 (x : nat) := x.
Theorem extensional_368 : f_368 = g_368.
Proof.
  apply functional_extensionality; intro x.
  unfold f_368, g_368.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_008.


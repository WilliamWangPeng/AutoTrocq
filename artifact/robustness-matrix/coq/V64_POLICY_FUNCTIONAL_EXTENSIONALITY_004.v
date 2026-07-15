(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_004.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_364 (x : nat) := x + 0.
Definition g_364 (x : nat) := x.
Theorem extensional_364 : f_364 = g_364.
Proof.
  apply functional_extensionality; intro x.
  unfold f_364, g_364.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_004.


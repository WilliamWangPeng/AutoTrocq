(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_016.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_376 (x : nat) := x + 0.
Definition g_376 (x : nat) := x.
Theorem extensional_376 : f_376 = g_376.
Proof.
  apply functional_extensionality; intro x.
  unfold f_376, g_376.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_016.


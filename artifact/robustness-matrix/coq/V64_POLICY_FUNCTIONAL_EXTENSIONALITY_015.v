(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_015.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_375 (x : nat) := x + 0.
Definition g_375 (x : nat) := x.
Theorem extensional_375 : f_375 = g_375.
Proof.
  apply functional_extensionality; intro x.
  unfold f_375, g_375.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_015.


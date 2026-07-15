(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_007.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_367 (x : nat) := x + 0.
Definition g_367 (x : nat) := x.
Theorem extensional_367 : f_367 = g_367.
Proof.
  apply functional_extensionality; intro x.
  unfold f_367, g_367.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_007.


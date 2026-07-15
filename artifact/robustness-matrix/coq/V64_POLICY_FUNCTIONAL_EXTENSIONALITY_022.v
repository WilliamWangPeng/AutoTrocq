(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_022.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_382 (x : nat) := x + 0.
Definition g_382 (x : nat) := x.
Theorem extensional_382 : f_382 = g_382.
Proof.
  apply functional_extensionality; intro x.
  unfold f_382, g_382.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_022.


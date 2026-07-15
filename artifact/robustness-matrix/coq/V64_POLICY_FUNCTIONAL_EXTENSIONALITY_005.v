(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_005.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_365 (x : nat) := x + 0.
Definition g_365 (x : nat) := x.
Theorem extensional_365 : f_365 = g_365.
Proof.
  apply functional_extensionality; intro x.
  unfold f_365, g_365.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_005.


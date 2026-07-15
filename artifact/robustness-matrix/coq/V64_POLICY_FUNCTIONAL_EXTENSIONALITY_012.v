(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_012.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_372 (x : nat) := x + 0.
Definition g_372 (x : nat) := x.
Theorem extensional_372 : f_372 = g_372.
Proof.
  apply functional_extensionality; intro x.
  unfold f_372, g_372.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_012.


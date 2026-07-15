(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_025.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_385 (x : nat) := x + 0.
Definition g_385 (x : nat) := x.
Theorem extensional_385 : f_385 = g_385.
Proof.
  apply functional_extensionality; intro x.
  unfold f_385, g_385.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_025.


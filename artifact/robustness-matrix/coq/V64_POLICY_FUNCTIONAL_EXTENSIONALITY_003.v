(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_003.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_363 (x : nat) := x + 0.
Definition g_363 (x : nat) := x.
Theorem extensional_363 : f_363 = g_363.
Proof.
  apply functional_extensionality; intro x.
  unfold f_363, g_363.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_003.


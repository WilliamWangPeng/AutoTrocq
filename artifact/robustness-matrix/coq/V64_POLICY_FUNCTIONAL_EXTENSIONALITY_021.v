(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_021.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_381 (x : nat) := x + 0.
Definition g_381 (x : nat) := x.
Theorem extensional_381 : f_381 = g_381.
Proof.
  apply functional_extensionality; intro x.
  unfold f_381, g_381.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_021.


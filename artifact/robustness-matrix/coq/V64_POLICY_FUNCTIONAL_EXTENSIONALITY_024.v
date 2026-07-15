(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_024.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_384 (x : nat) := x + 0.
Definition g_384 (x : nat) := x.
Theorem extensional_384 : f_384 = g_384.
Proof.
  apply functional_extensionality; intro x.
  unfold f_384, g_384.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_024.


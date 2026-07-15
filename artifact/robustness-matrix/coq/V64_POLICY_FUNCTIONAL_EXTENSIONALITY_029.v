(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_029.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_389 (x : nat) := x + 0.
Definition g_389 (x : nat) := x.
Theorem extensional_389 : f_389 = g_389.
Proof.
  apply functional_extensionality; intro x.
  unfold f_389, g_389.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_029.


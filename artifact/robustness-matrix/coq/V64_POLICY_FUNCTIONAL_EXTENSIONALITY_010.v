(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_010.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_370 (x : nat) := x + 0.
Definition g_370 (x : nat) := x.
Theorem extensional_370 : f_370 = g_370.
Proof.
  apply functional_extensionality; intro x.
  unfold f_370, g_370.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_010.


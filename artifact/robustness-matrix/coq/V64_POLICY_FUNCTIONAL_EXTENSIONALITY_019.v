(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_019.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_379 (x : nat) := x + 0.
Definition g_379 (x : nat) := x.
Theorem extensional_379 : f_379 = g_379.
Proof.
  apply functional_extensionality; intro x.
  unfold f_379, g_379.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_019.


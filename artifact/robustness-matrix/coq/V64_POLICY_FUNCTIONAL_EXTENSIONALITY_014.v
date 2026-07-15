(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_014.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_374 (x : nat) := x + 0.
Definition g_374 (x : nat) := x.
Theorem extensional_374 : f_374 = g_374.
Proof.
  apply functional_extensionality; intro x.
  unfold f_374, g_374.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_014.


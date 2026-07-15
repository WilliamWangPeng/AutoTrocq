(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_020.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_380 (x : nat) := x + 0.
Definition g_380 (x : nat) := x.
Theorem extensional_380 : f_380 = g_380.
Proof.
  apply functional_extensionality; intro x.
  unfold f_380, g_380.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_020.


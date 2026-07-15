(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_001.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_361 (x : nat) := x + 0.
Definition g_361 (x : nat) := x.
Theorem extensional_361 : f_361 = g_361.
Proof.
  apply functional_extensionality; intro x.
  unfold f_361, g_361.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_001.


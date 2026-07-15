(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_002.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_362 (x : nat) := x + 0.
Definition g_362 (x : nat) := x.
Theorem extensional_362 : f_362 = g_362.
Proof.
  apply functional_extensionality; intro x.
  unfold f_362, g_362.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_002.


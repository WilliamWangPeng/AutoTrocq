(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_030.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_390 (x : nat) := x + 0.
Definition g_390 (x : nat) := x.
Theorem extensional_390 : f_390 = g_390.
Proof.
  apply functional_extensionality; intro x.
  unfold f_390, g_390.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_030.


(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_017.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_377 (x : nat) := x + 0.
Definition g_377 (x : nat) := x.
Theorem extensional_377 : f_377 = g_377.
Proof.
  apply functional_extensionality; intro x.
  unfold f_377, g_377.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_017.


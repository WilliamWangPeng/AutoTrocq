(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_013.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_373 (x : nat) := x + 0.
Definition g_373 (x : nat) := x.
Theorem extensional_373 : f_373 = g_373.
Proof.
  apply functional_extensionality; intro x.
  unfold f_373, g_373.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_013.


(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_027.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_387 (x : nat) := x + 0.
Definition g_387 (x : nat) := x.
Theorem extensional_387 : f_387 = g_387.
Proof.
  apply functional_extensionality; intro x.
  unfold f_387, g_387.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_027.


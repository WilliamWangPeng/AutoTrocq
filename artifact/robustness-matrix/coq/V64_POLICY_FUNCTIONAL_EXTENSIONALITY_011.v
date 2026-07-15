(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_011.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_371 (x : nat) := x + 0.
Definition g_371 (x : nat) := x.
Theorem extensional_371 : f_371 = g_371.
Proof.
  apply functional_extensionality; intro x.
  unfold f_371, g_371.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_011.


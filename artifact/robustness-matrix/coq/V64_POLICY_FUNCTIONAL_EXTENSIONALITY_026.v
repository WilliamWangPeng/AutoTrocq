(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_026.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_386 (x : nat) := x + 0.
Definition g_386 (x : nat) := x.
Theorem extensional_386 : f_386 = g_386.
Proof.
  apply functional_extensionality; intro x.
  unfold f_386, g_386.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_026.


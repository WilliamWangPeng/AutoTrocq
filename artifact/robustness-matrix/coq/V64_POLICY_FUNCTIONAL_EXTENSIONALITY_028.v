(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_028.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_388 (x : nat) := x + 0.
Definition g_388 (x : nat) := x.
Theorem extensional_388 : f_388 = g_388.
Proof.
  apply functional_extensionality; intro x.
  unfold f_388, g_388.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_028.


(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_018.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_378 (x : nat) := x + 0.
Definition g_378 (x : nat) := x.
Theorem extensional_378 : f_378 = g_378.
Proof.
  apply functional_extensionality; intro x.
  unfold f_378, g_378.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_018.


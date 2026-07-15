(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_009.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_369 (x : nat) := x + 0.
Definition g_369 (x : nat) := x.
Theorem extensional_369 : f_369 = g_369.
Proof.
  apply functional_extensionality; intro x.
  unfold f_369, g_369.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_009.


(* V64 robustness-matrix module *)
Module V64_POLICY_FUNCTIONAL_EXTENSIONALITY_006.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Logic.FunctionalExtensionality.
Definition f_366 (x : nat) := x + 0.
Definition g_366 (x : nat) := x.
Theorem extensional_366 : f_366 = g_366.
Proof.
  apply functional_extensionality; intro x.
  unfold f_366, g_366.
  now rewrite Nat.add_0_r.
Qed.
End V64_POLICY_FUNCTIONAL_EXTENSIONALITY_006.


(* V60 case-study module *)
(* PATTERN: sigma packaging *)
(* TRANSFER_SHAPE: projection preservation *)

Module V60_SigmaPackage.
Definition bounded := { n : nat | n <= 3 }.

Definition erase (b : bounded) : nat := proj1_sig b.
Definition repack (b : bounded) : { n : nat | n <= 3 } := exist _ (erase b) (proj2_sig b).

Theorem erase_repack : forall b : bounded, erase (repack b) = erase b.
Proof.
  intros [n H].
  reflexivity.
Qed.

Theorem proof_irrelevant_free_projection : forall b : bounded, proj1_sig (repack b) = proj1_sig b.
Proof.
  intros [n H].
  reflexivity.
Qed.

Theorem example_bound : erase (exist _ 3 (le_n 3)) = 3.
Proof. reflexivity. Qed.
End V60_SigmaPackage.


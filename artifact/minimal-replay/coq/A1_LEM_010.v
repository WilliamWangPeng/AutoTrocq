(* Minimal kernel-candidate witness for A1-LEM-010.
   This file models the policy-level safe rejection used by the manuscript:
   excluded middle is not accepted under an empty axiom policy. *)

Fail Check classic.

Inductive axiom_effect : Type :=
| excluded_middle.

Inductive allowed_empty : axiom_effect -> Prop := .

Definition rejected_by_empty_policy (e : axiom_effect) : Prop :=
  ~ allowed_empty e.

Lemma excluded_middle_rejected :
  rejected_by_empty_policy excluded_middle.
Proof.
  unfold rejected_by_empty_policy.
  intros H.
  inversion H.
Qed.

Definition transfer_request_uses_excluded_middle : axiom_effect :=
  excluded_middle.

Lemma safe_reject_transfer_request :
  rejected_by_empty_policy transfer_request_uses_excluded_middle.
Proof.
  apply excluded_middle_rejected.
Qed.

(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_393.
Definition abs_393 (n : nat) : nat := n.
Definition repr_393 (n : nat) : nat := n.

Theorem retraction_393 : forall n : nat, abs_393 (repr_393 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_393.


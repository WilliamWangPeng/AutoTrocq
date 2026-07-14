(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_378.
Definition abs_378 (n : nat) : nat := n.
Definition repr_378 (n : nat) : nat := n.

Theorem retraction_378 : forall n : nat, abs_378 (repr_378 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_378.


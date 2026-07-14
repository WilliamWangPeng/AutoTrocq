(* V60 case-study module *)
(* PATTERN: product relation *)
(* TRANSFER_SHAPE: isomorphism *)

Module V60_ProductSwap.
Definition swap (p : nat * bool) : bool * nat := (snd p, fst p).
Definition unswap (p : bool * nat) : nat * bool := (snd p, fst p).

Theorem unswap_swap : forall p : nat * bool, unswap (swap p) = p.
Proof.
  intros [n b].
  reflexivity.
Qed.

Theorem swap_unswap : forall p : bool * nat, swap (unswap p) = p.
Proof.
  intros [b n].
  reflexivity.
Qed.

Theorem fst_transfer : forall p : nat * bool, snd (swap p) = fst p.
Proof.
  intros [n b].
  reflexivity.
Qed.
End V60_ProductSwap.


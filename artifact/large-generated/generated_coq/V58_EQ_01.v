(* V58 generated module *)
(* CATEGORY: eq *)

Module V58_EQ_01.
Theorem eq_succ_1 : forall n m : nat, n = m -> S n = S m.
Proof.
  intros n m H.
  now rewrite H.
Qed.
End V58_EQ_01.


(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_028.
Definition enc_268 (n : nat) : nat := S n.
Definition dec_268 (n : nat) : nat := n.
Theorem bad_roundtrip_268 : forall n, dec_268 (enc_268 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_028.


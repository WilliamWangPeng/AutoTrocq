(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_008.
Definition enc_248 (n : nat) : nat := S n.
Definition dec_248 (n : nat) : nat := n.
Theorem bad_roundtrip_248 : forall n, dec_248 (enc_248 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_008.


(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_006.
Definition enc_246 (n : nat) : nat := S n.
Definition dec_246 (n : nat) : nat := n.
Theorem bad_roundtrip_246 : forall n, dec_246 (enc_246 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_006.


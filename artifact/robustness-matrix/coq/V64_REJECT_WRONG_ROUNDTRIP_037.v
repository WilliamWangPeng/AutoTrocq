(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_037.
Definition enc_277 (n : nat) : nat := S n.
Definition dec_277 (n : nat) : nat := n.
Theorem bad_roundtrip_277 : forall n, dec_277 (enc_277 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_037.


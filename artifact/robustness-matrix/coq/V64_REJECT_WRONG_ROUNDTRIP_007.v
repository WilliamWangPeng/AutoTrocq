(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_007.
Definition enc_247 (n : nat) : nat := S n.
Definition dec_247 (n : nat) : nat := n.
Theorem bad_roundtrip_247 : forall n, dec_247 (enc_247 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_007.


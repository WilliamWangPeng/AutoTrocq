(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_011.
Definition enc_251 (n : nat) : nat := S n.
Definition dec_251 (n : nat) : nat := n.
Theorem bad_roundtrip_251 : forall n, dec_251 (enc_251 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_011.


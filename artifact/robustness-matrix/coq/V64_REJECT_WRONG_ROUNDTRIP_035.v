(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_035.
Definition enc_275 (n : nat) : nat := S n.
Definition dec_275 (n : nat) : nat := n.
Theorem bad_roundtrip_275 : forall n, dec_275 (enc_275 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_035.


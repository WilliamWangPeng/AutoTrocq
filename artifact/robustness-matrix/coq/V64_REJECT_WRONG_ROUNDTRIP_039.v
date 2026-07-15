(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_039.
Definition enc_279 (n : nat) : nat := S n.
Definition dec_279 (n : nat) : nat := n.
Theorem bad_roundtrip_279 : forall n, dec_279 (enc_279 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_039.


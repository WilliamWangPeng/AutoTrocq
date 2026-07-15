(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_021.
Definition enc_261 (n : nat) : nat := S n.
Definition dec_261 (n : nat) : nat := n.
Theorem bad_roundtrip_261 : forall n, dec_261 (enc_261 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_021.


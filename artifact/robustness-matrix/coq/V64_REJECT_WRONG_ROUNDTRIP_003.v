(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_003.
Definition enc_243 (n : nat) : nat := S n.
Definition dec_243 (n : nat) : nat := n.
Theorem bad_roundtrip_243 : forall n, dec_243 (enc_243 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_003.


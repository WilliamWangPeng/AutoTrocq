(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_033.
Definition enc_273 (n : nat) : nat := S n.
Definition dec_273 (n : nat) : nat := n.
Theorem bad_roundtrip_273 : forall n, dec_273 (enc_273 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_033.


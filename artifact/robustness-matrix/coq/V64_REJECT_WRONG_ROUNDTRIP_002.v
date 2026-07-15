(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_002.
Definition enc_242 (n : nat) : nat := S n.
Definition dec_242 (n : nat) : nat := n.
Theorem bad_roundtrip_242 : forall n, dec_242 (enc_242 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_002.


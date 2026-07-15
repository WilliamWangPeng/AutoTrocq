(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_001.
Definition enc_241 (n : nat) : nat := S n.
Definition dec_241 (n : nat) : nat := n.
Theorem bad_roundtrip_241 : forall n, dec_241 (enc_241 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_001.


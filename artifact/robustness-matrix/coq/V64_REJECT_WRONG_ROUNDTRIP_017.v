(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_017.
Definition enc_257 (n : nat) : nat := S n.
Definition dec_257 (n : nat) : nat := n.
Theorem bad_roundtrip_257 : forall n, dec_257 (enc_257 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_017.


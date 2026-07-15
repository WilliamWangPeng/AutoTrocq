(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_012.
Definition enc_252 (n : nat) : nat := S n.
Definition dec_252 (n : nat) : nat := n.
Theorem bad_roundtrip_252 : forall n, dec_252 (enc_252 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_012.


(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_013.
Definition enc_253 (n : nat) : nat := S n.
Definition dec_253 (n : nat) : nat := n.
Theorem bad_roundtrip_253 : forall n, dec_253 (enc_253 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_013.


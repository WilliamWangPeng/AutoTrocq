(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_030.
Definition enc_270 (n : nat) : nat := S n.
Definition dec_270 (n : nat) : nat := n.
Theorem bad_roundtrip_270 : forall n, dec_270 (enc_270 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_030.


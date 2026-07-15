(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_034.
Definition enc_274 (n : nat) : nat := S n.
Definition dec_274 (n : nat) : nat := n.
Theorem bad_roundtrip_274 : forall n, dec_274 (enc_274 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_034.


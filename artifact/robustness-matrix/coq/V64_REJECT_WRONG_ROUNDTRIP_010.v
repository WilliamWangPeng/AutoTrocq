(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_010.
Definition enc_250 (n : nat) : nat := S n.
Definition dec_250 (n : nat) : nat := n.
Theorem bad_roundtrip_250 : forall n, dec_250 (enc_250 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_010.


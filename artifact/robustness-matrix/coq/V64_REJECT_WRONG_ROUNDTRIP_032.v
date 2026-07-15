(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_032.
Definition enc_272 (n : nat) : nat := S n.
Definition dec_272 (n : nat) : nat := n.
Theorem bad_roundtrip_272 : forall n, dec_272 (enc_272 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_032.


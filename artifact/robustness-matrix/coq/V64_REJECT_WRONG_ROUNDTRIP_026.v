(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_026.
Definition enc_266 (n : nat) : nat := S n.
Definition dec_266 (n : nat) : nat := n.
Theorem bad_roundtrip_266 : forall n, dec_266 (enc_266 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_026.


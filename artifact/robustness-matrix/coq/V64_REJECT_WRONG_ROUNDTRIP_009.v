(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_009.
Definition enc_249 (n : nat) : nat := S n.
Definition dec_249 (n : nat) : nat := n.
Theorem bad_roundtrip_249 : forall n, dec_249 (enc_249 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_009.


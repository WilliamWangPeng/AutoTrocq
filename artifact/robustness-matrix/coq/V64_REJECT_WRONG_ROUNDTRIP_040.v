(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_040.
Definition enc_280 (n : nat) : nat := S n.
Definition dec_280 (n : nat) : nat := n.
Theorem bad_roundtrip_280 : forall n, dec_280 (enc_280 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_040.


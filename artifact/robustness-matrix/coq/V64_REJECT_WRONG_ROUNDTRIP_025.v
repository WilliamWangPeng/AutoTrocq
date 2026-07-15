(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_025.
Definition enc_265 (n : nat) : nat := S n.
Definition dec_265 (n : nat) : nat := n.
Theorem bad_roundtrip_265 : forall n, dec_265 (enc_265 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_025.


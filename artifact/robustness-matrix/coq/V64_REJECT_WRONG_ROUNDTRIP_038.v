(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_038.
Definition enc_278 (n : nat) : nat := S n.
Definition dec_278 (n : nat) : nat := n.
Theorem bad_roundtrip_278 : forall n, dec_278 (enc_278 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_038.


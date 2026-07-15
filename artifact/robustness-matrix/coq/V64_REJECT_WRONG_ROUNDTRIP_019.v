(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_019.
Definition enc_259 (n : nat) : nat := S n.
Definition dec_259 (n : nat) : nat := n.
Theorem bad_roundtrip_259 : forall n, dec_259 (enc_259 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_019.


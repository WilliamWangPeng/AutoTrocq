(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_020.
Definition enc_260 (n : nat) : nat := S n.
Definition dec_260 (n : nat) : nat := n.
Theorem bad_roundtrip_260 : forall n, dec_260 (enc_260 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_020.


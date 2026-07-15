(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_015.
Definition enc_255 (n : nat) : nat := S n.
Definition dec_255 (n : nat) : nat := n.
Theorem bad_roundtrip_255 : forall n, dec_255 (enc_255 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_015.


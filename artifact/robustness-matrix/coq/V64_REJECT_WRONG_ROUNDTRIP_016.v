(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_016.
Definition enc_256 (n : nat) : nat := S n.
Definition dec_256 (n : nat) : nat := n.
Theorem bad_roundtrip_256 : forall n, dec_256 (enc_256 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_016.


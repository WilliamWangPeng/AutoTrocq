(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_022.
Definition enc_262 (n : nat) : nat := S n.
Definition dec_262 (n : nat) : nat := n.
Theorem bad_roundtrip_262 : forall n, dec_262 (enc_262 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_022.


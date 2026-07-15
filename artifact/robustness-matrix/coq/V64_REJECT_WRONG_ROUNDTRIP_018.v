(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_018.
Definition enc_258 (n : nat) : nat := S n.
Definition dec_258 (n : nat) : nat := n.
Theorem bad_roundtrip_258 : forall n, dec_258 (enc_258 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_018.


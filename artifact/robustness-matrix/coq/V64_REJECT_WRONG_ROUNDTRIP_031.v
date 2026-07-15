(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_031.
Definition enc_271 (n : nat) : nat := S n.
Definition dec_271 (n : nat) : nat := n.
Theorem bad_roundtrip_271 : forall n, dec_271 (enc_271 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_031.


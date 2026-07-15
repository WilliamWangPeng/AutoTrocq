(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_027.
Definition enc_267 (n : nat) : nat := S n.
Definition dec_267 (n : nat) : nat := n.
Theorem bad_roundtrip_267 : forall n, dec_267 (enc_267 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_027.


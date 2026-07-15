(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_023.
Definition enc_263 (n : nat) : nat := S n.
Definition dec_263 (n : nat) : nat := n.
Theorem bad_roundtrip_263 : forall n, dec_263 (enc_263 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_023.


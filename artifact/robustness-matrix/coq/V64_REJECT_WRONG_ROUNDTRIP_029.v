(* V64 robustness-matrix module *)
Module V64_REJECT_WRONG_ROUNDTRIP_029.
Definition enc_269 (n : nat) : nat := S n.
Definition dec_269 (n : nat) : nat := n.
Theorem bad_roundtrip_269 : forall n, dec_269 (enc_269 n) = n.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_WRONG_ROUNDTRIP_029.


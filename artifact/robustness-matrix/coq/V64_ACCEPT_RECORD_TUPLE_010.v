(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_010.
Record src_10 := mkSrc_10 { sx_10 : nat; sy_10 : nat }.
Definition enc_10 (p : src_10) : nat * nat := (sx_10 p, sy_10 p).
Definition dec_10 (q : nat * nat) : src_10 := mkSrc_10 (fst q) (snd q).
Theorem roundtrip_10 : forall p : src_10, dec_10 (enc_10 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_10 : forall p : src_10, fst (enc_10 p) + snd (enc_10 p) = sx_10 p + sy_10 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_010.


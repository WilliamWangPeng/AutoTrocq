(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_004.
Record src_4 := mkSrc_4 { sx_4 : nat; sy_4 : nat }.
Definition enc_4 (p : src_4) : nat * nat := (sx_4 p, sy_4 p).
Definition dec_4 (q : nat * nat) : src_4 := mkSrc_4 (fst q) (snd q).
Theorem roundtrip_4 : forall p : src_4, dec_4 (enc_4 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_4 : forall p : src_4, fst (enc_4 p) + snd (enc_4 p) = sx_4 p + sy_4 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_004.


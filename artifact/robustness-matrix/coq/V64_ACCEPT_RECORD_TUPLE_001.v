(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_001.
Record src_1 := mkSrc_1 { sx_1 : nat; sy_1 : nat }.
Definition enc_1 (p : src_1) : nat * nat := (sx_1 p, sy_1 p).
Definition dec_1 (q : nat * nat) : src_1 := mkSrc_1 (fst q) (snd q).
Theorem roundtrip_1 : forall p : src_1, dec_1 (enc_1 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_1 : forall p : src_1, fst (enc_1 p) + snd (enc_1 p) = sx_1 p + sy_1 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_001.


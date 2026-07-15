(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_008.
Record src_8 := mkSrc_8 { sx_8 : nat; sy_8 : nat }.
Definition enc_8 (p : src_8) : nat * nat := (sx_8 p, sy_8 p).
Definition dec_8 (q : nat * nat) : src_8 := mkSrc_8 (fst q) (snd q).
Theorem roundtrip_8 : forall p : src_8, dec_8 (enc_8 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_8 : forall p : src_8, fst (enc_8 p) + snd (enc_8 p) = sx_8 p + sy_8 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_008.


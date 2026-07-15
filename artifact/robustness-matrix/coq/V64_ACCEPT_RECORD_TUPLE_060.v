(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_060.
Record src_60 := mkSrc_60 { sx_60 : nat; sy_60 : nat }.
Definition enc_60 (p : src_60) : nat * nat := (sx_60 p, sy_60 p).
Definition dec_60 (q : nat * nat) : src_60 := mkSrc_60 (fst q) (snd q).
Theorem roundtrip_60 : forall p : src_60, dec_60 (enc_60 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_60 : forall p : src_60, fst (enc_60 p) + snd (enc_60 p) = sx_60 p + sy_60 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_060.


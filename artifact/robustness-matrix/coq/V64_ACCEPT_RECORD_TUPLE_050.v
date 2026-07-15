(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_050.
Record src_50 := mkSrc_50 { sx_50 : nat; sy_50 : nat }.
Definition enc_50 (p : src_50) : nat * nat := (sx_50 p, sy_50 p).
Definition dec_50 (q : nat * nat) : src_50 := mkSrc_50 (fst q) (snd q).
Theorem roundtrip_50 : forall p : src_50, dec_50 (enc_50 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_50 : forall p : src_50, fst (enc_50 p) + snd (enc_50 p) = sx_50 p + sy_50 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_050.


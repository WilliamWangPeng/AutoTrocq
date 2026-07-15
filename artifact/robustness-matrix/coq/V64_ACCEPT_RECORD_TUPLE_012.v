(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_012.
Record src_12 := mkSrc_12 { sx_12 : nat; sy_12 : nat }.
Definition enc_12 (p : src_12) : nat * nat := (sx_12 p, sy_12 p).
Definition dec_12 (q : nat * nat) : src_12 := mkSrc_12 (fst q) (snd q).
Theorem roundtrip_12 : forall p : src_12, dec_12 (enc_12 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_12 : forall p : src_12, fst (enc_12 p) + snd (enc_12 p) = sx_12 p + sy_12 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_012.


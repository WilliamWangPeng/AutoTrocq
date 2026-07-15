(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_017.
Record src_17 := mkSrc_17 { sx_17 : nat; sy_17 : nat }.
Definition enc_17 (p : src_17) : nat * nat := (sx_17 p, sy_17 p).
Definition dec_17 (q : nat * nat) : src_17 := mkSrc_17 (fst q) (snd q).
Theorem roundtrip_17 : forall p : src_17, dec_17 (enc_17 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_17 : forall p : src_17, fst (enc_17 p) + snd (enc_17 p) = sx_17 p + sy_17 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_017.


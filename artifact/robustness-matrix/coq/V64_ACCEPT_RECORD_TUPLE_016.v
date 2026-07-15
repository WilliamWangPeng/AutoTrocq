(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_016.
Record src_16 := mkSrc_16 { sx_16 : nat; sy_16 : nat }.
Definition enc_16 (p : src_16) : nat * nat := (sx_16 p, sy_16 p).
Definition dec_16 (q : nat * nat) : src_16 := mkSrc_16 (fst q) (snd q).
Theorem roundtrip_16 : forall p : src_16, dec_16 (enc_16 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_16 : forall p : src_16, fst (enc_16 p) + snd (enc_16 p) = sx_16 p + sy_16 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_016.


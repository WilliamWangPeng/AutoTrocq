(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_032.
Record src_32 := mkSrc_32 { sx_32 : nat; sy_32 : nat }.
Definition enc_32 (p : src_32) : nat * nat := (sx_32 p, sy_32 p).
Definition dec_32 (q : nat * nat) : src_32 := mkSrc_32 (fst q) (snd q).
Theorem roundtrip_32 : forall p : src_32, dec_32 (enc_32 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_32 : forall p : src_32, fst (enc_32 p) + snd (enc_32 p) = sx_32 p + sy_32 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_032.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_024.
Record src_24 := mkSrc_24 { sx_24 : nat; sy_24 : nat }.
Definition enc_24 (p : src_24) : nat * nat := (sx_24 p, sy_24 p).
Definition dec_24 (q : nat * nat) : src_24 := mkSrc_24 (fst q) (snd q).
Theorem roundtrip_24 : forall p : src_24, dec_24 (enc_24 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_24 : forall p : src_24, fst (enc_24 p) + snd (enc_24 p) = sx_24 p + sy_24 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_024.


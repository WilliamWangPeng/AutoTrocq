(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_052.
Record src_52 := mkSrc_52 { sx_52 : nat; sy_52 : nat }.
Definition enc_52 (p : src_52) : nat * nat := (sx_52 p, sy_52 p).
Definition dec_52 (q : nat * nat) : src_52 := mkSrc_52 (fst q) (snd q).
Theorem roundtrip_52 : forall p : src_52, dec_52 (enc_52 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_52 : forall p : src_52, fst (enc_52 p) + snd (enc_52 p) = sx_52 p + sy_52 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_052.


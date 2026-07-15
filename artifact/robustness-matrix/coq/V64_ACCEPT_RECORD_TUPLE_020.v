(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_020.
Record src_20 := mkSrc_20 { sx_20 : nat; sy_20 : nat }.
Definition enc_20 (p : src_20) : nat * nat := (sx_20 p, sy_20 p).
Definition dec_20 (q : nat * nat) : src_20 := mkSrc_20 (fst q) (snd q).
Theorem roundtrip_20 : forall p : src_20, dec_20 (enc_20 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_20 : forall p : src_20, fst (enc_20 p) + snd (enc_20 p) = sx_20 p + sy_20 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_020.


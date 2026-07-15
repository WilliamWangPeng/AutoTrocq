(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_058.
Record src_58 := mkSrc_58 { sx_58 : nat; sy_58 : nat }.
Definition enc_58 (p : src_58) : nat * nat := (sx_58 p, sy_58 p).
Definition dec_58 (q : nat * nat) : src_58 := mkSrc_58 (fst q) (snd q).
Theorem roundtrip_58 : forall p : src_58, dec_58 (enc_58 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_58 : forall p : src_58, fst (enc_58 p) + snd (enc_58 p) = sx_58 p + sy_58 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_058.


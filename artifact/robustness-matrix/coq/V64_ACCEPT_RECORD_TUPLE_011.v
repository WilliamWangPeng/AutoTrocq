(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_011.
Record src_11 := mkSrc_11 { sx_11 : nat; sy_11 : nat }.
Definition enc_11 (p : src_11) : nat * nat := (sx_11 p, sy_11 p).
Definition dec_11 (q : nat * nat) : src_11 := mkSrc_11 (fst q) (snd q).
Theorem roundtrip_11 : forall p : src_11, dec_11 (enc_11 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_11 : forall p : src_11, fst (enc_11 p) + snd (enc_11 p) = sx_11 p + sy_11 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_011.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_006.
Record src_6 := mkSrc_6 { sx_6 : nat; sy_6 : nat }.
Definition enc_6 (p : src_6) : nat * nat := (sx_6 p, sy_6 p).
Definition dec_6 (q : nat * nat) : src_6 := mkSrc_6 (fst q) (snd q).
Theorem roundtrip_6 : forall p : src_6, dec_6 (enc_6 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_6 : forall p : src_6, fst (enc_6 p) + snd (enc_6 p) = sx_6 p + sy_6 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_006.


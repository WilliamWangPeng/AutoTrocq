(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_026.
Record src_26 := mkSrc_26 { sx_26 : nat; sy_26 : nat }.
Definition enc_26 (p : src_26) : nat * nat := (sx_26 p, sy_26 p).
Definition dec_26 (q : nat * nat) : src_26 := mkSrc_26 (fst q) (snd q).
Theorem roundtrip_26 : forall p : src_26, dec_26 (enc_26 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_26 : forall p : src_26, fst (enc_26 p) + snd (enc_26 p) = sx_26 p + sy_26 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_026.


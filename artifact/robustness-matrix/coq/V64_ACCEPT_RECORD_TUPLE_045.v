(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_045.
Record src_45 := mkSrc_45 { sx_45 : nat; sy_45 : nat }.
Definition enc_45 (p : src_45) : nat * nat := (sx_45 p, sy_45 p).
Definition dec_45 (q : nat * nat) : src_45 := mkSrc_45 (fst q) (snd q).
Theorem roundtrip_45 : forall p : src_45, dec_45 (enc_45 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_45 : forall p : src_45, fst (enc_45 p) + snd (enc_45 p) = sx_45 p + sy_45 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_045.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_046.
Record src_46 := mkSrc_46 { sx_46 : nat; sy_46 : nat }.
Definition enc_46 (p : src_46) : nat * nat := (sx_46 p, sy_46 p).
Definition dec_46 (q : nat * nat) : src_46 := mkSrc_46 (fst q) (snd q).
Theorem roundtrip_46 : forall p : src_46, dec_46 (enc_46 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_46 : forall p : src_46, fst (enc_46 p) + snd (enc_46 p) = sx_46 p + sy_46 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_046.


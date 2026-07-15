(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_027.
Record src_27 := mkSrc_27 { sx_27 : nat; sy_27 : nat }.
Definition enc_27 (p : src_27) : nat * nat := (sx_27 p, sy_27 p).
Definition dec_27 (q : nat * nat) : src_27 := mkSrc_27 (fst q) (snd q).
Theorem roundtrip_27 : forall p : src_27, dec_27 (enc_27 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_27 : forall p : src_27, fst (enc_27 p) + snd (enc_27 p) = sx_27 p + sy_27 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_027.


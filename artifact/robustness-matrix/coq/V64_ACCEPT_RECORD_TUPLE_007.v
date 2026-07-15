(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_007.
Record src_7 := mkSrc_7 { sx_7 : nat; sy_7 : nat }.
Definition enc_7 (p : src_7) : nat * nat := (sx_7 p, sy_7 p).
Definition dec_7 (q : nat * nat) : src_7 := mkSrc_7 (fst q) (snd q).
Theorem roundtrip_7 : forall p : src_7, dec_7 (enc_7 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_7 : forall p : src_7, fst (enc_7 p) + snd (enc_7 p) = sx_7 p + sy_7 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_007.


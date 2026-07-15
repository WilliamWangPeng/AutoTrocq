(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_030.
Record src_30 := mkSrc_30 { sx_30 : nat; sy_30 : nat }.
Definition enc_30 (p : src_30) : nat * nat := (sx_30 p, sy_30 p).
Definition dec_30 (q : nat * nat) : src_30 := mkSrc_30 (fst q) (snd q).
Theorem roundtrip_30 : forall p : src_30, dec_30 (enc_30 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_30 : forall p : src_30, fst (enc_30 p) + snd (enc_30 p) = sx_30 p + sy_30 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_030.


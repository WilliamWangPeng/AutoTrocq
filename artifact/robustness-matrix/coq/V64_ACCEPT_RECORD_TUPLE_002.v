(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_002.
Record src_2 := mkSrc_2 { sx_2 : nat; sy_2 : nat }.
Definition enc_2 (p : src_2) : nat * nat := (sx_2 p, sy_2 p).
Definition dec_2 (q : nat * nat) : src_2 := mkSrc_2 (fst q) (snd q).
Theorem roundtrip_2 : forall p : src_2, dec_2 (enc_2 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_2 : forall p : src_2, fst (enc_2 p) + snd (enc_2 p) = sx_2 p + sy_2 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_002.


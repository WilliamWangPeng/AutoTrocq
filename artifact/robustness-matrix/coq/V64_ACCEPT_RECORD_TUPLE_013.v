(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_013.
Record src_13 := mkSrc_13 { sx_13 : nat; sy_13 : nat }.
Definition enc_13 (p : src_13) : nat * nat := (sx_13 p, sy_13 p).
Definition dec_13 (q : nat * nat) : src_13 := mkSrc_13 (fst q) (snd q).
Theorem roundtrip_13 : forall p : src_13, dec_13 (enc_13 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_13 : forall p : src_13, fst (enc_13 p) + snd (enc_13 p) = sx_13 p + sy_13 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_013.


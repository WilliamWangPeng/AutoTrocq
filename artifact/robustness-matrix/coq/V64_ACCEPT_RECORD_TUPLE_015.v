(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_015.
Record src_15 := mkSrc_15 { sx_15 : nat; sy_15 : nat }.
Definition enc_15 (p : src_15) : nat * nat := (sx_15 p, sy_15 p).
Definition dec_15 (q : nat * nat) : src_15 := mkSrc_15 (fst q) (snd q).
Theorem roundtrip_15 : forall p : src_15, dec_15 (enc_15 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_15 : forall p : src_15, fst (enc_15 p) + snd (enc_15 p) = sx_15 p + sy_15 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_015.


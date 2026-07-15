(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_009.
Record src_9 := mkSrc_9 { sx_9 : nat; sy_9 : nat }.
Definition enc_9 (p : src_9) : nat * nat := (sx_9 p, sy_9 p).
Definition dec_9 (q : nat * nat) : src_9 := mkSrc_9 (fst q) (snd q).
Theorem roundtrip_9 : forall p : src_9, dec_9 (enc_9 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_9 : forall p : src_9, fst (enc_9 p) + snd (enc_9 p) = sx_9 p + sy_9 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_009.


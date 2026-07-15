(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_003.
Record src_3 := mkSrc_3 { sx_3 : nat; sy_3 : nat }.
Definition enc_3 (p : src_3) : nat * nat := (sx_3 p, sy_3 p).
Definition dec_3 (q : nat * nat) : src_3 := mkSrc_3 (fst q) (snd q).
Theorem roundtrip_3 : forall p : src_3, dec_3 (enc_3 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_3 : forall p : src_3, fst (enc_3 p) + snd (enc_3 p) = sx_3 p + sy_3 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_003.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_039.
Record src_39 := mkSrc_39 { sx_39 : nat; sy_39 : nat }.
Definition enc_39 (p : src_39) : nat * nat := (sx_39 p, sy_39 p).
Definition dec_39 (q : nat * nat) : src_39 := mkSrc_39 (fst q) (snd q).
Theorem roundtrip_39 : forall p : src_39, dec_39 (enc_39 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_39 : forall p : src_39, fst (enc_39 p) + snd (enc_39 p) = sx_39 p + sy_39 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_039.


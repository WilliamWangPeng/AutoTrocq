(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_025.
Record src_25 := mkSrc_25 { sx_25 : nat; sy_25 : nat }.
Definition enc_25 (p : src_25) : nat * nat := (sx_25 p, sy_25 p).
Definition dec_25 (q : nat * nat) : src_25 := mkSrc_25 (fst q) (snd q).
Theorem roundtrip_25 : forall p : src_25, dec_25 (enc_25 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_25 : forall p : src_25, fst (enc_25 p) + snd (enc_25 p) = sx_25 p + sy_25 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_025.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_035.
Record src_35 := mkSrc_35 { sx_35 : nat; sy_35 : nat }.
Definition enc_35 (p : src_35) : nat * nat := (sx_35 p, sy_35 p).
Definition dec_35 (q : nat * nat) : src_35 := mkSrc_35 (fst q) (snd q).
Theorem roundtrip_35 : forall p : src_35, dec_35 (enc_35 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_35 : forall p : src_35, fst (enc_35 p) + snd (enc_35 p) = sx_35 p + sy_35 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_035.


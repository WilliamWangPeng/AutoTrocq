(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_005.
Record src_5 := mkSrc_5 { sx_5 : nat; sy_5 : nat }.
Definition enc_5 (p : src_5) : nat * nat := (sx_5 p, sy_5 p).
Definition dec_5 (q : nat * nat) : src_5 := mkSrc_5 (fst q) (snd q).
Theorem roundtrip_5 : forall p : src_5, dec_5 (enc_5 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_5 : forall p : src_5, fst (enc_5 p) + snd (enc_5 p) = sx_5 p + sy_5 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_005.


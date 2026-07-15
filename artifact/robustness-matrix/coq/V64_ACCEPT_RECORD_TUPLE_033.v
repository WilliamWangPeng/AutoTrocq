(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_033.
Record src_33 := mkSrc_33 { sx_33 : nat; sy_33 : nat }.
Definition enc_33 (p : src_33) : nat * nat := (sx_33 p, sy_33 p).
Definition dec_33 (q : nat * nat) : src_33 := mkSrc_33 (fst q) (snd q).
Theorem roundtrip_33 : forall p : src_33, dec_33 (enc_33 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_33 : forall p : src_33, fst (enc_33 p) + snd (enc_33 p) = sx_33 p + sy_33 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_033.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_056.
Record src_56 := mkSrc_56 { sx_56 : nat; sy_56 : nat }.
Definition enc_56 (p : src_56) : nat * nat := (sx_56 p, sy_56 p).
Definition dec_56 (q : nat * nat) : src_56 := mkSrc_56 (fst q) (snd q).
Theorem roundtrip_56 : forall p : src_56, dec_56 (enc_56 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_56 : forall p : src_56, fst (enc_56 p) + snd (enc_56 p) = sx_56 p + sy_56 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_056.


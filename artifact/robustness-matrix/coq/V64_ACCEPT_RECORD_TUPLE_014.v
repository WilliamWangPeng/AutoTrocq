(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_014.
Record src_14 := mkSrc_14 { sx_14 : nat; sy_14 : nat }.
Definition enc_14 (p : src_14) : nat * nat := (sx_14 p, sy_14 p).
Definition dec_14 (q : nat * nat) : src_14 := mkSrc_14 (fst q) (snd q).
Theorem roundtrip_14 : forall p : src_14, dec_14 (enc_14 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_14 : forall p : src_14, fst (enc_14 p) + snd (enc_14 p) = sx_14 p + sy_14 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_014.


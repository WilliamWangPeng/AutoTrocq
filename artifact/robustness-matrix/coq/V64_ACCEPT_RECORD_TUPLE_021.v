(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_021.
Record src_21 := mkSrc_21 { sx_21 : nat; sy_21 : nat }.
Definition enc_21 (p : src_21) : nat * nat := (sx_21 p, sy_21 p).
Definition dec_21 (q : nat * nat) : src_21 := mkSrc_21 (fst q) (snd q).
Theorem roundtrip_21 : forall p : src_21, dec_21 (enc_21 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_21 : forall p : src_21, fst (enc_21 p) + snd (enc_21 p) = sx_21 p + sy_21 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_021.


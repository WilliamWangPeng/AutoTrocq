(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_019.
Record src_19 := mkSrc_19 { sx_19 : nat; sy_19 : nat }.
Definition enc_19 (p : src_19) : nat * nat := (sx_19 p, sy_19 p).
Definition dec_19 (q : nat * nat) : src_19 := mkSrc_19 (fst q) (snd q).
Theorem roundtrip_19 : forall p : src_19, dec_19 (enc_19 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_19 : forall p : src_19, fst (enc_19 p) + snd (enc_19 p) = sx_19 p + sy_19 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_019.


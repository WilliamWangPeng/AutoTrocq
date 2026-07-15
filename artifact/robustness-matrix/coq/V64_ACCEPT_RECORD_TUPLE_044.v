(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_044.
Record src_44 := mkSrc_44 { sx_44 : nat; sy_44 : nat }.
Definition enc_44 (p : src_44) : nat * nat := (sx_44 p, sy_44 p).
Definition dec_44 (q : nat * nat) : src_44 := mkSrc_44 (fst q) (snd q).
Theorem roundtrip_44 : forall p : src_44, dec_44 (enc_44 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_44 : forall p : src_44, fst (enc_44 p) + snd (enc_44 p) = sx_44 p + sy_44 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_044.


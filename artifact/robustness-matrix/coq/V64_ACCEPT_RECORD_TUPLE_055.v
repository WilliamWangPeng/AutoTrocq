(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_055.
Record src_55 := mkSrc_55 { sx_55 : nat; sy_55 : nat }.
Definition enc_55 (p : src_55) : nat * nat := (sx_55 p, sy_55 p).
Definition dec_55 (q : nat * nat) : src_55 := mkSrc_55 (fst q) (snd q).
Theorem roundtrip_55 : forall p : src_55, dec_55 (enc_55 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_55 : forall p : src_55, fst (enc_55 p) + snd (enc_55 p) = sx_55 p + sy_55 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_055.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_018.
Record src_18 := mkSrc_18 { sx_18 : nat; sy_18 : nat }.
Definition enc_18 (p : src_18) : nat * nat := (sx_18 p, sy_18 p).
Definition dec_18 (q : nat * nat) : src_18 := mkSrc_18 (fst q) (snd q).
Theorem roundtrip_18 : forall p : src_18, dec_18 (enc_18 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_18 : forall p : src_18, fst (enc_18 p) + snd (enc_18 p) = sx_18 p + sy_18 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_018.


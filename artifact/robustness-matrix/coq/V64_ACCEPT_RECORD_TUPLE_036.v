(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_036.
Record src_36 := mkSrc_36 { sx_36 : nat; sy_36 : nat }.
Definition enc_36 (p : src_36) : nat * nat := (sx_36 p, sy_36 p).
Definition dec_36 (q : nat * nat) : src_36 := mkSrc_36 (fst q) (snd q).
Theorem roundtrip_36 : forall p : src_36, dec_36 (enc_36 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_36 : forall p : src_36, fst (enc_36 p) + snd (enc_36 p) = sx_36 p + sy_36 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_036.


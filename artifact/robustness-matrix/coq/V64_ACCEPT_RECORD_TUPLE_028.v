(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_028.
Record src_28 := mkSrc_28 { sx_28 : nat; sy_28 : nat }.
Definition enc_28 (p : src_28) : nat * nat := (sx_28 p, sy_28 p).
Definition dec_28 (q : nat * nat) : src_28 := mkSrc_28 (fst q) (snd q).
Theorem roundtrip_28 : forall p : src_28, dec_28 (enc_28 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_28 : forall p : src_28, fst (enc_28 p) + snd (enc_28 p) = sx_28 p + sy_28 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_028.


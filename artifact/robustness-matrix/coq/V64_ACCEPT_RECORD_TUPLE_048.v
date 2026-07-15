(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_048.
Record src_48 := mkSrc_48 { sx_48 : nat; sy_48 : nat }.
Definition enc_48 (p : src_48) : nat * nat := (sx_48 p, sy_48 p).
Definition dec_48 (q : nat * nat) : src_48 := mkSrc_48 (fst q) (snd q).
Theorem roundtrip_48 : forall p : src_48, dec_48 (enc_48 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_48 : forall p : src_48, fst (enc_48 p) + snd (enc_48 p) = sx_48 p + sy_48 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_048.


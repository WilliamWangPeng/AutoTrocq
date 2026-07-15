(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_038.
Record src_38 := mkSrc_38 { sx_38 : nat; sy_38 : nat }.
Definition enc_38 (p : src_38) : nat * nat := (sx_38 p, sy_38 p).
Definition dec_38 (q : nat * nat) : src_38 := mkSrc_38 (fst q) (snd q).
Theorem roundtrip_38 : forall p : src_38, dec_38 (enc_38 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_38 : forall p : src_38, fst (enc_38 p) + snd (enc_38 p) = sx_38 p + sy_38 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_038.


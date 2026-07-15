(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_051.
Record src_51 := mkSrc_51 { sx_51 : nat; sy_51 : nat }.
Definition enc_51 (p : src_51) : nat * nat := (sx_51 p, sy_51 p).
Definition dec_51 (q : nat * nat) : src_51 := mkSrc_51 (fst q) (snd q).
Theorem roundtrip_51 : forall p : src_51, dec_51 (enc_51 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_51 : forall p : src_51, fst (enc_51 p) + snd (enc_51 p) = sx_51 p + sy_51 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_051.


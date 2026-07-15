(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_022.
Record src_22 := mkSrc_22 { sx_22 : nat; sy_22 : nat }.
Definition enc_22 (p : src_22) : nat * nat := (sx_22 p, sy_22 p).
Definition dec_22 (q : nat * nat) : src_22 := mkSrc_22 (fst q) (snd q).
Theorem roundtrip_22 : forall p : src_22, dec_22 (enc_22 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_22 : forall p : src_22, fst (enc_22 p) + snd (enc_22 p) = sx_22 p + sy_22 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_022.


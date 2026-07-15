(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_043.
Record src_43 := mkSrc_43 { sx_43 : nat; sy_43 : nat }.
Definition enc_43 (p : src_43) : nat * nat := (sx_43 p, sy_43 p).
Definition dec_43 (q : nat * nat) : src_43 := mkSrc_43 (fst q) (snd q).
Theorem roundtrip_43 : forall p : src_43, dec_43 (enc_43 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_43 : forall p : src_43, fst (enc_43 p) + snd (enc_43 p) = sx_43 p + sy_43 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_043.


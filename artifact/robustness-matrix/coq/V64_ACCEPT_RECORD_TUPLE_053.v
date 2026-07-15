(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_053.
Record src_53 := mkSrc_53 { sx_53 : nat; sy_53 : nat }.
Definition enc_53 (p : src_53) : nat * nat := (sx_53 p, sy_53 p).
Definition dec_53 (q : nat * nat) : src_53 := mkSrc_53 (fst q) (snd q).
Theorem roundtrip_53 : forall p : src_53, dec_53 (enc_53 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_53 : forall p : src_53, fst (enc_53 p) + snd (enc_53 p) = sx_53 p + sy_53 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_053.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_040.
Record src_40 := mkSrc_40 { sx_40 : nat; sy_40 : nat }.
Definition enc_40 (p : src_40) : nat * nat := (sx_40 p, sy_40 p).
Definition dec_40 (q : nat * nat) : src_40 := mkSrc_40 (fst q) (snd q).
Theorem roundtrip_40 : forall p : src_40, dec_40 (enc_40 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_40 : forall p : src_40, fst (enc_40 p) + snd (enc_40 p) = sx_40 p + sy_40 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_040.


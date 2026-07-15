(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_031.
Record src_31 := mkSrc_31 { sx_31 : nat; sy_31 : nat }.
Definition enc_31 (p : src_31) : nat * nat := (sx_31 p, sy_31 p).
Definition dec_31 (q : nat * nat) : src_31 := mkSrc_31 (fst q) (snd q).
Theorem roundtrip_31 : forall p : src_31, dec_31 (enc_31 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_31 : forall p : src_31, fst (enc_31 p) + snd (enc_31 p) = sx_31 p + sy_31 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_031.


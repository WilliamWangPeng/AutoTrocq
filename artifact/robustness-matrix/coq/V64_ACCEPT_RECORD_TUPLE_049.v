(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_049.
Record src_49 := mkSrc_49 { sx_49 : nat; sy_49 : nat }.
Definition enc_49 (p : src_49) : nat * nat := (sx_49 p, sy_49 p).
Definition dec_49 (q : nat * nat) : src_49 := mkSrc_49 (fst q) (snd q).
Theorem roundtrip_49 : forall p : src_49, dec_49 (enc_49 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_49 : forall p : src_49, fst (enc_49 p) + snd (enc_49 p) = sx_49 p + sy_49 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_049.


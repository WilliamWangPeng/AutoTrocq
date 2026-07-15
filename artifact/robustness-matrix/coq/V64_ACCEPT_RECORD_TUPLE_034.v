(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_034.
Record src_34 := mkSrc_34 { sx_34 : nat; sy_34 : nat }.
Definition enc_34 (p : src_34) : nat * nat := (sx_34 p, sy_34 p).
Definition dec_34 (q : nat * nat) : src_34 := mkSrc_34 (fst q) (snd q).
Theorem roundtrip_34 : forall p : src_34, dec_34 (enc_34 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_34 : forall p : src_34, fst (enc_34 p) + snd (enc_34 p) = sx_34 p + sy_34 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_034.


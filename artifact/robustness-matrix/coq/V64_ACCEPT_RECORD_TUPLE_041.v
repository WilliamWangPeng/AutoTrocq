(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_041.
Record src_41 := mkSrc_41 { sx_41 : nat; sy_41 : nat }.
Definition enc_41 (p : src_41) : nat * nat := (sx_41 p, sy_41 p).
Definition dec_41 (q : nat * nat) : src_41 := mkSrc_41 (fst q) (snd q).
Theorem roundtrip_41 : forall p : src_41, dec_41 (enc_41 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_41 : forall p : src_41, fst (enc_41 p) + snd (enc_41 p) = sx_41 p + sy_41 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_041.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_023.
Record src_23 := mkSrc_23 { sx_23 : nat; sy_23 : nat }.
Definition enc_23 (p : src_23) : nat * nat := (sx_23 p, sy_23 p).
Definition dec_23 (q : nat * nat) : src_23 := mkSrc_23 (fst q) (snd q).
Theorem roundtrip_23 : forall p : src_23, dec_23 (enc_23 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_23 : forall p : src_23, fst (enc_23 p) + snd (enc_23 p) = sx_23 p + sy_23 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_023.


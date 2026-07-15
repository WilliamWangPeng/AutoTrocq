(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_042.
Record src_42 := mkSrc_42 { sx_42 : nat; sy_42 : nat }.
Definition enc_42 (p : src_42) : nat * nat := (sx_42 p, sy_42 p).
Definition dec_42 (q : nat * nat) : src_42 := mkSrc_42 (fst q) (snd q).
Theorem roundtrip_42 : forall p : src_42, dec_42 (enc_42 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_42 : forall p : src_42, fst (enc_42 p) + snd (enc_42 p) = sx_42 p + sy_42 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_042.


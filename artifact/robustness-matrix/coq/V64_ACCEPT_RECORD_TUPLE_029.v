(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_029.
Record src_29 := mkSrc_29 { sx_29 : nat; sy_29 : nat }.
Definition enc_29 (p : src_29) : nat * nat := (sx_29 p, sy_29 p).
Definition dec_29 (q : nat * nat) : src_29 := mkSrc_29 (fst q) (snd q).
Theorem roundtrip_29 : forall p : src_29, dec_29 (enc_29 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_29 : forall p : src_29, fst (enc_29 p) + snd (enc_29 p) = sx_29 p + sy_29 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_029.


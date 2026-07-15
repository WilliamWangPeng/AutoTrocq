(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_057.
Record src_57 := mkSrc_57 { sx_57 : nat; sy_57 : nat }.
Definition enc_57 (p : src_57) : nat * nat := (sx_57 p, sy_57 p).
Definition dec_57 (q : nat * nat) : src_57 := mkSrc_57 (fst q) (snd q).
Theorem roundtrip_57 : forall p : src_57, dec_57 (enc_57 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_57 : forall p : src_57, fst (enc_57 p) + snd (enc_57 p) = sx_57 p + sy_57 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_057.


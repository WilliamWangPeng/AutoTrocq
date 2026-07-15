(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_037.
Record src_37 := mkSrc_37 { sx_37 : nat; sy_37 : nat }.
Definition enc_37 (p : src_37) : nat * nat := (sx_37 p, sy_37 p).
Definition dec_37 (q : nat * nat) : src_37 := mkSrc_37 (fst q) (snd q).
Theorem roundtrip_37 : forall p : src_37, dec_37 (enc_37 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_37 : forall p : src_37, fst (enc_37 p) + snd (enc_37 p) = sx_37 p + sy_37 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_037.


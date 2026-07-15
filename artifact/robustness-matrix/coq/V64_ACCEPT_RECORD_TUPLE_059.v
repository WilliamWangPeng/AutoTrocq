(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_059.
Record src_59 := mkSrc_59 { sx_59 : nat; sy_59 : nat }.
Definition enc_59 (p : src_59) : nat * nat := (sx_59 p, sy_59 p).
Definition dec_59 (q : nat * nat) : src_59 := mkSrc_59 (fst q) (snd q).
Theorem roundtrip_59 : forall p : src_59, dec_59 (enc_59 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_59 : forall p : src_59, fst (enc_59 p) + snd (enc_59 p) = sx_59 p + sy_59 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_059.


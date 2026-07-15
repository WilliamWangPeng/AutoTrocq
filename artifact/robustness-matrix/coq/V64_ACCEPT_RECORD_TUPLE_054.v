(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_054.
Record src_54 := mkSrc_54 { sx_54 : nat; sy_54 : nat }.
Definition enc_54 (p : src_54) : nat * nat := (sx_54 p, sy_54 p).
Definition dec_54 (q : nat * nat) : src_54 := mkSrc_54 (fst q) (snd q).
Theorem roundtrip_54 : forall p : src_54, dec_54 (enc_54 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_54 : forall p : src_54, fst (enc_54 p) + snd (enc_54 p) = sx_54 p + sy_54 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_054.


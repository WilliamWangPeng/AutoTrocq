(* V64 robustness-matrix module *)
Module V64_ACCEPT_RECORD_TUPLE_047.
Record src_47 := mkSrc_47 { sx_47 : nat; sy_47 : nat }.
Definition enc_47 (p : src_47) : nat * nat := (sx_47 p, sy_47 p).
Definition dec_47 (q : nat * nat) : src_47 := mkSrc_47 (fst q) (snd q).
Theorem roundtrip_47 : forall p : src_47, dec_47 (enc_47 p) = p.
Proof. intros [a b]; reflexivity. Qed.
Theorem measure_transfer_47 : forall p : src_47, fst (enc_47 p) + snd (enc_47 p) = sx_47 p + sy_47 p.
Proof. intros [a b]; reflexivity. Qed.
End V64_ACCEPT_RECORD_TUPLE_047.


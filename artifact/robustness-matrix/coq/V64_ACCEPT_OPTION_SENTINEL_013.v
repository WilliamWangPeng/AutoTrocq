(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_013.
Definition enc_73 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_73 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_73 : forall o, dec_73 (enc_73 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_73 : forall o, enc_73 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_013.


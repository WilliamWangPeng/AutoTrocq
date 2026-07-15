(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_002.
Definition enc_62 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_62 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_62 : forall o, dec_62 (enc_62 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_62 : forall o, enc_62 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_002.


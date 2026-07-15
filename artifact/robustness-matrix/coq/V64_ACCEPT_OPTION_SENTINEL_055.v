(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_055.
Definition enc_115 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_115 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_115 : forall o, dec_115 (enc_115 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_115 : forall o, enc_115 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_055.


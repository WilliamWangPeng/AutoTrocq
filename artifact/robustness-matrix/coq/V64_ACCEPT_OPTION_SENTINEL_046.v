(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_046.
Definition enc_106 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_106 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_106 : forall o, dec_106 (enc_106 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_106 : forall o, enc_106 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_046.


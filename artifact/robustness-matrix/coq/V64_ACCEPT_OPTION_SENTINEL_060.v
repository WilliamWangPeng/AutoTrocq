(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_060.
Definition enc_120 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_120 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_120 : forall o, dec_120 (enc_120 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_120 : forall o, enc_120 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_060.


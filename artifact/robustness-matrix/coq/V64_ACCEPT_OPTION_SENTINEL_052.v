(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_052.
Definition enc_112 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_112 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_112 : forall o, dec_112 (enc_112 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_112 : forall o, enc_112 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_052.


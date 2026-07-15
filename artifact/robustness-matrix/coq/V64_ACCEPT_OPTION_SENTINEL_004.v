(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_004.
Definition enc_64 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_64 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_64 : forall o, dec_64 (enc_64 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_64 : forall o, enc_64 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_004.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_020.
Definition enc_80 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_80 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_80 : forall o, dec_80 (enc_80 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_80 : forall o, enc_80 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_020.


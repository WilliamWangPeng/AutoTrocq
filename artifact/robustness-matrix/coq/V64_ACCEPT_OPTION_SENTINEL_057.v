(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_057.
Definition enc_117 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_117 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_117 : forall o, dec_117 (enc_117 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_117 : forall o, enc_117 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_057.


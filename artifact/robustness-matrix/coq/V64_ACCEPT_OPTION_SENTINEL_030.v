(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_030.
Definition enc_90 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_90 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_90 : forall o, dec_90 (enc_90 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_90 : forall o, enc_90 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_030.


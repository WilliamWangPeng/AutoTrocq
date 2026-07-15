(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_024.
Definition enc_84 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_84 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_84 : forall o, dec_84 (enc_84 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_84 : forall o, enc_84 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_024.


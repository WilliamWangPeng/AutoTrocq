(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_019.
Definition enc_79 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_79 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_79 : forall o, dec_79 (enc_79 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_79 : forall o, enc_79 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_019.


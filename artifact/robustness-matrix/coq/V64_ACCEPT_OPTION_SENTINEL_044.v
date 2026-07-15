(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_044.
Definition enc_104 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_104 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_104 : forall o, dec_104 (enc_104 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_104 : forall o, enc_104 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_044.


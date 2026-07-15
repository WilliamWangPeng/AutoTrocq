(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_047.
Definition enc_107 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_107 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_107 : forall o, dec_107 (enc_107 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_107 : forall o, enc_107 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_047.


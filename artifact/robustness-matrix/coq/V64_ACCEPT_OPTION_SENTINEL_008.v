(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_008.
Definition enc_68 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_68 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_68 : forall o, dec_68 (enc_68 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_68 : forall o, enc_68 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_008.


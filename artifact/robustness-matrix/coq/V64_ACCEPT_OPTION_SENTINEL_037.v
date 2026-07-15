(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_037.
Definition enc_97 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_97 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_97 : forall o, dec_97 (enc_97 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_97 : forall o, enc_97 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_037.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_045.
Definition enc_105 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_105 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_105 : forall o, dec_105 (enc_105 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_105 : forall o, enc_105 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_045.


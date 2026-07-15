(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_033.
Definition enc_93 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_93 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_93 : forall o, dec_93 (enc_93 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_93 : forall o, enc_93 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_033.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_059.
Definition enc_119 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_119 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_119 : forall o, dec_119 (enc_119 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_119 : forall o, enc_119 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_059.


(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_032.
Definition enc_92 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_92 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_92 : forall o, dec_92 (enc_92 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_92 : forall o, enc_92 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_032.


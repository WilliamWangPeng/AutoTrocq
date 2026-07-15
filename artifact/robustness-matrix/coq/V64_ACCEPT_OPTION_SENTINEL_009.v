(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_009.
Definition enc_69 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_69 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_69 : forall o, dec_69 (enc_69 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_69 : forall o, enc_69 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_009.


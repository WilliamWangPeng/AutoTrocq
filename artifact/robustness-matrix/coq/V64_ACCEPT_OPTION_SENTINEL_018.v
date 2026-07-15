(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_018.
Definition enc_78 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_78 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_78 : forall o, dec_78 (enc_78 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_78 : forall o, enc_78 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_018.


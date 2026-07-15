(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_012.
Definition enc_72 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_72 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_72 : forall o, dec_72 (enc_72 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_72 : forall o, enc_72 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_012.


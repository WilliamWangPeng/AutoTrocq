(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_014.
Definition enc_74 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_74 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_74 : forall o, dec_74 (enc_74 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_74 : forall o, enc_74 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_014.


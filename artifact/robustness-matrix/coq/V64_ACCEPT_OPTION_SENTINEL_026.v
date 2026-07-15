(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_026.
Definition enc_86 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_86 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_86 : forall o, dec_86 (enc_86 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_86 : forall o, enc_86 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_026.


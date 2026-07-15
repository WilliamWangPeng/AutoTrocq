(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_029.
Definition enc_89 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_89 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_89 : forall o, dec_89 (enc_89 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_89 : forall o, enc_89 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_029.


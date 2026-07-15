(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_058.
Definition enc_118 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_118 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_118 : forall o, dec_118 (enc_118 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_118 : forall o, enc_118 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_058.

